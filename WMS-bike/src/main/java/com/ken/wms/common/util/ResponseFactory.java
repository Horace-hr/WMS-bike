package com.ken.wms.common.util;

/**
 * Response 工厂类
 *
 * 

 */
public class ResponseFactory {

    /**
     * 生成一个 Response 对象
     *
     * @return response 对象
     */
    public static Response newInstance() {
        return new Response();
    }

}
