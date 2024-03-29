package com.lucene.demo01;

import com.lucene.utils.PropertiesClient;
import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.index.DirectoryReader;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.index.Term;
import org.apache.lucene.search.*;
import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.util.QueryBuilder;

import java.nio.file.Paths;

public class Searcher {

    static String indexDir = PropertiesClient.INDEX;

    public static void main(String[] args) {

        SelectQuery("cach"); //精确查找

    }

    static void SelectQuery(String text) {


        try {

            FSDirectory fsDirectory = FSDirectory.open(Paths.get(indexDir));

            IndexReader reader = DirectoryReader.open(fsDirectory);

            IndexSearcher searcher = new IndexSearcher(reader);

            Query query = null;

            query = creatQuery(text);

            TopDocs docs = searcher.search(query, 10);

            if (docs.totalHits == 0)

                System.out.println("Not found");

            else {

                for (ScoreDoc scoreDoc : docs.scoreDocs) {

                    System.out.println(searcher.doc(scoreDoc.doc).get("username"));

                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    static Query creatQuery(String text) {
        Analyzer analyzer = new StandardAnalyzer();
        QueryBuilder builder = new QueryBuilder(analyzer);
        Query query = builder.createPhraseQuery("name", text);
        return query;
    }

}
