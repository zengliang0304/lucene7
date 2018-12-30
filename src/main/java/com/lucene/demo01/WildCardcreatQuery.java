package com.lucene.demo01;

import com.lucene.utils.PropertiesClient;
import org.apache.lucene.index.DirectoryReader;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.index.Term;
import org.apache.lucene.search.*;
import org.apache.lucene.store.FSDirectory;

import java.nio.file.Paths;


/***
 *  通配符查找
 */
public class WildCardcreatQuery {

    static String indexDir = PropertiesClient.INDEX;

    public static void main(String[] args) {

        SelectQuery("小米");

    }

    static void SelectQuery(String text) {

        try {

            FSDirectory fsDirectory = FSDirectory.open(Paths.get(indexDir));

            IndexReader reader = DirectoryReader.open(fsDirectory);

            IndexSearcher searcher = new IndexSearcher(reader);

            Query query = null;

            query = WildCardcreatQuery(text);

            TopDocs docs = searcher.search(query, 10);

            if (docs.totalHits == 0)

                System.out.println("Not found");

            else {

                for (ScoreDoc scoreDoc : docs.scoreDocs) {

                    System.out.println(searcher.doc(scoreDoc.doc).get("erp"));

                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    static Query WildCardcreatQuery(String text) {
        WildcardQuery query = new WildcardQuery(new Term("name", "*" + text + "*"));
        return query;
    }

}
