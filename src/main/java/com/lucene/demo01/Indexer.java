package com.lucene.demo01;

import com.lucene.utils.PropertiesClient;
import com.lucene.utils.mysqlClient;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.StringField;
import org.apache.lucene.document.TextField;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.store.FSDirectory;
import org.wltea.analyzer.lucene.IKAnalyzer;

import java.io.IOException;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Date;

/***
 * 从mysql中读取数据建立索引
 *
 *
 * 备注：StringField 不分词 ， TextField分词
 *
 */
public class Indexer {

    static String indexDir = PropertiesClient.INDEX;

    public static void main(String[] args) {

        CreateIndex();

    }

    public static void CreateIndex() {

        Connection connection = mysqlClient.getConnection();

        System.out.println("Successful....");

        String query = "SELECT * FROM USER";

        try {
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery(query);

            IndexWriter writer = CreateWriter();
            long startTime = new Date().getTime();
            while (rs.next()) {
                Document document = new Document();

                System.out.println(rs.getString("id")+rs.getString("erp")+rs.getString("username")+rs.getString("organization"));

                document.add(new StringField("id", rs.getString("id"), Field.Store.YES));
                document.add(new TextField("erp", rs.getString("erp"), Field.Store.YES));
                document.add(new TextField("username", rs.getString("username"), Field.Store.YES));
                document.add(new TextField("organization", rs.getString("organization"), Field.Store.YES));
                writer.addDocument(document);
            }
            long endTime = new Date().getTime();
            writer.commit();
            writer.close();
            connection.close();
            System.out.println("Time taken to index : " + (endTime - startTime));
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    static IndexWriter CreateWriter() {
        FSDirectory fsDirectory;
        IndexWriter writer = null;
        try {
            fsDirectory = FSDirectory.open(Paths.get(indexDir));
            IndexWriterConfig conf = new IndexWriterConfig(new IKAnalyzer());
            writer = new IndexWriter(fsDirectory, conf);
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return writer;
    }


}
