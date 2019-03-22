package com.zr.news.util;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.zr.news.entity.PageBean;

import java.util.List;

/**
 * @author : 张晋飞
 * date : 2019/3/22
 */
public class JsonUtil {

    public static <T> JSONObject getJsonObject(List<T> list , PageBean pageBean) {
        Object jsonArr = JSONArray.toJSON(list);
        JSONObject array=new JSONObject();
        array.put("code",0);
        array.put("msg","");
        array.put("count",pageBean.getCount());
        array.put("data",jsonArr);
        return array;
    }
}
