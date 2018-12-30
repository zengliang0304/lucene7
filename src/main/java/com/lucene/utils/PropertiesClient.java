package com.lucene.utils;

import java.io.FileInputStream;
import java.util.Properties;


/***
 * 读取配置文件
 */
public class PropertiesClient {
    private static final String PROPERTIES_NAME = "/Users/huiyu/ideaProject/myCoding/lucene7/src/main/resources/db.properties";
    public static String DB_DRIVER = null;
    public static String DB_URL = null;
    public static String DB_USER = null;
    public static String DB_PWD = null;
    public static String INDEX = null;

    static {
        FileInputStream in = null;
        try {
            Properties properties = new Properties();
            in = new FileInputStream(PROPERTIES_NAME);
            properties.load(in);
            DB_DRIVER = properties.getProperty("driver");
            DB_URL = properties.getProperty("url");
            DB_USER = properties.getProperty("username");
            DB_PWD = properties.getProperty("password");
            INDEX =  properties.getProperty("index");
            System.out.println("读取配置信息成功！");
            showConfig();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("读取配置信息失败！");
        } finally {
            if (in != null) {
                try {
                    in.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
    }

    private static void showConfig() {
        System.out.println("-----------------------配置信息-----------------");
        System.out.println("dirver: " + DB_DRIVER);
        System.out.println("url: " + DB_URL);
        System.out.println("user: " + DB_USER);
        System.out.println("password: " + DB_PWD);
        System.out.println("index: " + INDEX);
        System.out.println("----------------------------------------------");
    }

    public static void main(String[] args) {

//        showConfig();

    }
}