package com.ken.wms.common.controller;

import com.ken.wms.common.service.Interface.CustomerManageService;
import com.ken.wms.common.util.Response;
import com.ken.wms.common.util.ResponseFactory;
import com.ken.wms.domain.Customer;
import com.ken.wms.domain.Supplier;
import com.ken.wms.exception.CustomerManageServiceException;
import com.ken.wms.recommender.MySlopeOneRecommender;
import com.ken.wms.security.util.MD5Util;

import org.apache.commons.lang3.StringUtils;
import org.apache.mahout.cf.taste.common.TasteException;
import org.apache.mahout.cf.taste.impl.common.FastByIDMap;
import org.apache.mahout.cf.taste.impl.model.GenericDataModel;
import org.apache.mahout.cf.taste.impl.model.GenericUserPreferenceArray;
import org.apache.mahout.cf.taste.impl.model.file.FileDataModel;
import org.apache.mahout.cf.taste.impl.neighborhood.NearestNUserNeighborhood;
import org.apache.mahout.cf.taste.impl.recommender.CachingRecommender;
import org.apache.mahout.cf.taste.impl.recommender.GenericUserBasedRecommender;
import org.apache.mahout.cf.taste.impl.recommender.slopeone.SlopeOneRecommender;
import org.apache.mahout.cf.taste.impl.similarity.PearsonCorrelationSimilarity;
import org.apache.mahout.cf.taste.model.DataModel;
import org.apache.mahout.cf.taste.model.PreferenceArray;
import org.apache.mahout.cf.taste.neighborhood.UserNeighborhood;
import org.apache.mahout.cf.taste.recommender.RecommendedItem;
import org.apache.mahout.cf.taste.recommender.Recommender;
import org.apache.mahout.cf.taste.similarity.UserSimilarity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;
import java.util.Map;

/**
 * 客户信息管理请求 Handler
 *
 *  */
@RequestMapping(value = "/**/customerManage")
@Controller
public class CustomerManageHandler {

    @Autowired
    private CustomerManageService customerManageService;

    private static final String SEARCH_BY_ID = "searchByID";
    private static final String SEARCH_BY_NAME = "searchByName";
    private static final String SEARCH_ALL = "searchAll";

    /**
     * 通用的结果查询方法
     *
     * @param searchType 查询方式
     * @param keyWord    查询关键字
     * @param offset     分页偏移值
     * @param limit      分页大小
     * @return 返回指定条件查询的结果
     */
    private Map<String, Object> query(String searchType, String keyWord, int offset, int limit) throws CustomerManageServiceException {
        Map<String, Object> queryResult = null;

        switch (searchType) {
            case SEARCH_BY_ID:
                if (StringUtils.isNumeric(keyWord))
                    queryResult = customerManageService.selectById(Integer.valueOf(keyWord));
                break;
            case SEARCH_BY_NAME:
                queryResult = customerManageService.selectByName(offset, limit, keyWord);
                break;
            case SEARCH_ALL:
                queryResult = customerManageService.selectAll(offset, limit);
                break;
            default:
                // do other thing
                break;
        }
        return queryResult;
    }

    /**
     * 搜索客户信息
     *
     * @param searchType 搜索类型
     * @param offset     如有多条记录时分页的偏移值
     * @param limit      如有多条记录时分页的大小
     * @param keyWord    搜索的关键字
     * @return 返回查询的结果，其中键值为 rows 的代表查询到的每一记录，若有分页则为分页大小的记录；键值为 total 代表查询到的符合要求的记录总条数
     */
    @SuppressWarnings("unchecked")
    @RequestMapping(value = "getCustomerList", method = RequestMethod.GET)
    public
    @ResponseBody
    Map<String, Object> getCustomerList(@RequestParam("searchType") String searchType,
                                        @RequestParam("offset") int offset,
                                        @RequestParam("limit") int limit,
                                        @RequestParam("keyWord") String keyWord) throws CustomerManageServiceException {
        // 初始化 Response
        Response responseContent = ResponseFactory.newInstance();

        List<Supplier> rows = null;
        long total = 0;

        Map<String, Object> queryResult = query(searchType, keyWord, offset, limit);

        if (queryResult != null) {
            rows = (List<Supplier>) queryResult.get("data");
            total = (long) queryResult.get("total");
        }
        
        // 设置 Response
        responseContent.setCustomerInfo("rows", rows);
        responseContent.setResponseTotal(total);
        responseContent.setResponseResult(Response.RESPONSE_RESULT_SUCCESS);
        return responseContent.generateResponse();
    }

    /**
     * 添加一条客户信息
     *
     * @param customer 客户信息
     * @return 返回一个map，其中：key 为 result表示操作的结果，包括：success 与 error
     */
    @RequestMapping(value = "addCustomer", method = RequestMethod.POST)
    public
    @ResponseBody
    Map<String, Object> addCustomer(@RequestBody Customer customer) throws CustomerManageServiceException {
        // 初始化 Response
        Response responseContent = ResponseFactory.newInstance();

        // 添加记录
        String result = customerManageService.addCustomer(customer) ? Response.RESPONSE_RESULT_SUCCESS : Response.RESPONSE_RESULT_ERROR;

        responseContent.setResponseResult(result);
        return responseContent.generateResponse();
    }

    /**
     * 查询指定 customer ID 客户的信息
     *
     * @param customerID 客户ID
     * @return 返回一个map，其中：key 为 result 的值为操作的结果，包括：success 与 error；key 为 data
     * 的值为客户信息
     */
    @RequestMapping(value = "getCustomerInfo", method = RequestMethod.GET)
    public
    @ResponseBody
    Map<String, Object> getCustomerInfo(@RequestParam("customerID") String customerID) throws CustomerManageServiceException {
        // 初始化 Response
        Response responseContent = ResponseFactory.newInstance();
        String result = Response.RESPONSE_RESULT_ERROR;

        // 获取客户信息
        Customer customer = null;
        Map<String, Object> queryResult = query(SEARCH_BY_ID, customerID, -1, -1);
        if (queryResult != null) {
            customer = (Customer) queryResult.get("data");
            if (customer != null) {
                result = Response.RESPONSE_RESULT_SUCCESS;
            }
        }

        // 设置 Response
        responseContent.setResponseResult(result);
        responseContent.setResponseData(customer);

        return responseContent.generateResponse();
    }

    /**
     * 更新客户信息
     *
     * @param customer 客户信息
     * @return 返回一个map，其中：key 为 result表示操作的结果，包括：success 与 error
     */
    @RequestMapping(value = "updateCustomer", method = RequestMethod.POST)
    public
    @ResponseBody
    Map<String, Object> updateCustomer(@RequestBody Customer customer) throws CustomerManageServiceException {
        // 初始化 Response
        Response responseContent = ResponseFactory.newInstance();

        // 更新
        String result = customerManageService.updateCustomer(customer) ? Response.RESPONSE_RESULT_SUCCESS : Response.RESPONSE_RESULT_ERROR;

        responseContent.setResponseResult(result);
        return responseContent.generateResponse();
    }

    /**
     * 删除客户记录
     *
     * @param customerIDStr 客户ID
     * @return 返回一个map，其中：key 为 result表示操作的结果，包括：success 与 error
     */
    @RequestMapping(value = "deleteCustomer", method = RequestMethod.GET)
    public
    @ResponseBody
    Map<String, Object> deleteCustomer(@RequestParam("customerID") String customerIDStr) throws CustomerManageServiceException {
        // 初始化 Response
        Response responseContent = ResponseFactory.newInstance();

        // 参数检查
        if (StringUtils.isNumeric(customerIDStr)) {
            // 转换为 Integer
            Integer customerID = Integer.valueOf(customerIDStr);

            // 刪除
            String result = customerManageService.deleteCustomer(customerID) ? Response.RESPONSE_RESULT_SUCCESS : Response.RESPONSE_RESULT_ERROR;
            responseContent.setResponseResult(result);
        } else
            responseContent.setResponseResult(Response.RESPONSE_RESULT_ERROR);

        return responseContent.generateResponse();
    }

    /**
     * 导入客户信息
     *
     * @param file 保存有客户信息的文件
     * @return 返回一个map，其中：key 为 result表示操作的结果，包括：success 与
     * error；key为total表示导入的总条数；key为available表示有效的条数
     */
    @RequestMapping(value = "importCustomer", method = RequestMethod.POST)
    public
    @ResponseBody
    Map<String, Object> importCustomer(@RequestParam("file") MultipartFile file) throws CustomerManageServiceException {
        // 初始化 Response
        Response responseContent = ResponseFactory.newInstance();
        String result = Response.RESPONSE_RESULT_SUCCESS;

        // 读取文件内容
        int total = 0;
        int available = 0;
        if (file == null)
            result = Response.RESPONSE_RESULT_ERROR;
        Map<String, Object> importInfo = customerManageService.importCustomer(file);
        if (importInfo != null) {
            total = (int) importInfo.get("total");
            available = (int) importInfo.get("available");
        }

        responseContent.setResponseResult(result);
        responseContent.setResponseTotal(total);
        responseContent.setCustomerInfo("available", available);
        return responseContent.generateResponse();
    }

    /**
     * 导出客户信息
     *
     * @param searchType 查找类型
     * @param keyWord    查找关键字
     * @param response   HttpServletResponse
     */
    @SuppressWarnings("unchecked")
    @RequestMapping(value = "exportCustomer", method = RequestMethod.GET)
    public void exportCustomer(@RequestParam("searchType") String searchType, @RequestParam("keyWord") String keyWord,
                               HttpServletResponse response) throws CustomerManageServiceException, IOException {

        String fileName = "customerInfo.xlsx";

        List<Customer> customers = null;
        Map<String, Object> queryResult = query(searchType, keyWord, -1, -1);

        if (queryResult != null) {
            customers = (List<Customer>) queryResult.get("data");
        }

        // 获取生成的文件
        File file = customerManageService.exportCustomer(customers);

        // 写出文件
        if (file != null) {
            // 设置响应头
            response.addHeader("Content-Disposition", "attachment;filename=" + fileName);
            FileInputStream inputStream = new FileInputStream(file);
            OutputStream outputStream = response.getOutputStream();
            byte[] buffer = new byte[8192];

            int len;
            while ((len = inputStream.read(buffer, 0, buffer.length)) > 0) {
                outputStream.write(buffer, 0, len);
                outputStream.flush();
            }

            inputStream.close();
            outputStream.close();

        }
    }
    
    
    /**
     * 客户偏好预测
     * @throws TasteException 
     *
     * 
     */
    @RequestMapping(value = "getCustomerId", method = RequestMethod.GET)
    public
    @ResponseBody
    Map<String, Object> importCustomer(@RequestParam("customerId") long customerId) throws CustomerManageServiceException, TasteException {
        // 初始化 Response
        Response responseContent = ResponseFactory.newInstance();
        String result = Response.RESPONSE_RESULT_SUCCESS;
        FastByIDMap<PreferenceArray> preferences = new FastByIDMap<PreferenceArray>();

		PreferenceArray prefsForUser1 = new GenericUserPreferenceArray(3);// 注意这里的数字
		// 这里是用来存储一个用户的元数据，这些元数据通常来自日志文件，比如浏览历史，等等，不同的业务场合，它的业务语义是不一样
		
		prefsForUser1.setUserID(0, 1);
		
		prefsForUser1.setItemID(0, 103);
		prefsForUser1.setValue(0, 5.0f);//<1, 101, 5.0f>         < 用户 ID, 物品 ID, 用户偏好 >
		
		prefsForUser1.setItemID(1, 104);
		prefsForUser1.setValue(1, 3.0f);//<1, 102, 3.0f>

		prefsForUser1.setItemID(2, 105);
		prefsForUser1.setValue(2, 2.5f);//<1, 103, 2.5f>

		preferences.put(1214, prefsForUser1);// 在这里添加数据，userID作为key

		PreferenceArray prefsForUser2 = new GenericUserPreferenceArray(4);

		prefsForUser2.setUserID(0, 2);

		prefsForUser2.setItemID(0, 103);//<2, 101, 2.0f>
		prefsForUser2.setValue(0, 2.0f);

		prefsForUser2.setItemID(1, 105);
		prefsForUser2.setValue(1, 2.5f);//<2, 102, 2.5f>

		prefsForUser2.setItemID(2, 106);
		prefsForUser2.setValue(2, 5.0f);//<2, 103, 5.0f>

		prefsForUser2.setItemID(3, 104);
		prefsForUser2.setValue(3, 2.0f);//<2, 104, 2.0f>

		preferences.put(1215, prefsForUser2);

		PreferenceArray prefsForUser3 = new GenericUserPreferenceArray(4);

		prefsForUser3.setUserID(0, 3);

		prefsForUser3.setItemID(0, 103);
		prefsForUser3.setValue(0, 2.5f);

		prefsForUser3.setItemID(1, 104);

		prefsForUser3.setItemID(2, 105);
		prefsForUser3.setValue(2, 4.5f);

		prefsForUser3.setItemID(3, 107);
		prefsForUser3.setValue(3, 5.0f);

		preferences.put(1216, prefsForUser3);

		PreferenceArray prefsForUser4 = new GenericUserPreferenceArray(6);

		prefsForUser4.setUserID(0, 4);

		prefsForUser4.setItemID(0, 103);
		prefsForUser4.setValue(0, 5.0f);

		prefsForUser4.setItemID(1, 104);
		prefsForUser4.setValue(1, 3.0f);

		prefsForUser4.setItemID(2, 107);
		prefsForUser4.setValue(2, 4.5f);

		prefsForUser4.setItemID(3, 105);
		prefsForUser4.setValue(3, 4.0f);
		
		prefsForUser4.setItemID(4, 103);
		prefsForUser4.setValue(4, 3.5f);

		prefsForUser4.setItemID(5, 109);
		prefsForUser4.setValue(5, 4.0f);


		preferences.put(1217, prefsForUser4);
		
		PreferenceArray prefsForUser5 = new GenericUserPreferenceArray(6);

		prefsForUser5.setUserID(0, 5);

		prefsForUser5.setItemID(0, 103);
		prefsForUser5.setValue(0, 5.0f);

		prefsForUser5.setItemID(1, 104);
		prefsForUser5.setValue(1, 3.0f);

		prefsForUser5.setItemID(2, 107);
		prefsForUser5.setValue(2, 4.5f);

		prefsForUser5.setItemID(3, 105);
		prefsForUser5.setValue(3, 4.0f);
		
		prefsForUser5.setItemID(4, 103);
		prefsForUser5.setValue(4, 3.5f);

		prefsForUser5.setItemID(5, 109);
		prefsForUser5.setValue(5, 4.0f);

		preferences.put(1218, prefsForUser5);
		
		DataModel model = new GenericDataModel(preferences);// DataModel的建立
		UserSimilarity similarity = new PearsonCorrelationSimilarity(model);//计算相似度
		UserNeighborhood neighborhood = new NearestNUserNeighborhood(2,similarity, model);//计算邻居
		// 创建推荐引擎
		Recommender recommender = new GenericUserBasedRecommender(model,neighborhood, similarity);
		//为客户推荐1个相似结果
		List<RecommendedItem> recommendations = recommender.recommend(customerId, 1);
		System.out.println("推荐结果："+recommendations.toString());
		
		if(0==recommendations.size()) {
			result = Response.RESPONSE_RESULT_ERROR;
		}
        responseContent.setResponseResult(result);
        responseContent.setResponseData(recommendations);
        return responseContent.generateResponse();
    }
    
    
    
    
    
    
    
    
}
