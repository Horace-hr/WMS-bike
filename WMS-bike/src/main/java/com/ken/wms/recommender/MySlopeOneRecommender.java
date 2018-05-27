package com.ken.wms.recommender;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.mahout.cf.taste.impl.model.file.FileDataModel;
import org.apache.mahout.cf.taste.impl.recommender.CachingRecommender;
import org.apache.mahout.cf.taste.impl.recommender.slopeone.SlopeOneRecommender;
import org.apache.mahout.cf.taste.impl.similarity.PearsonCorrelationSimilarity;
import org.apache.mahout.cf.taste.model.DataModel;
import org.apache.mahout.cf.taste.recommender.RecommendedItem;
import org.apache.mahout.cf.taste.recommender.Recommender;
import org.apache.mahout.cf.taste.similarity.ItemSimilarity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ken.wms.common.util.Response;
import com.ken.wms.common.util.ResponseFactory;

/**
 * 
 * @author jiyu 利用分类算法中的K近邻的公式，结合协同过滤算法针对客户采购自行车的偏好进行智能推荐预采购车型 Slope
 *         One算法是基于不同物品之间的评分差的线性算法，预测用户对物品评分的个性化算法
 */

public class MySlopeOneRecommender {

	
	public  List<RecommendedItem> mySlopeOneRecommender(long customerId) {
		List<RecommendedItem> recommendations = null;
		try {
			DataModel model = new FileDataModel(new File("C://Users/jiyu/Desktop/data/bike_preferences.txt"));// 构造数据模型
			Recommender recommender = new CachingRecommender(new SlopeOneRecommender(model));// 构造推荐引擎
			recommendations = recommender.recommend(customerId, 2);// 得到推荐的结果，size是推荐接过的数目
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return recommendations;
	}

}