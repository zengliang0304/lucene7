package com.lucene.demo02.search.util;

import org.apache.lucene.search.IndexSearcher;

import java.io.IOException;


public class HighlighterTest {
    public static void main(String[] args) {

        try {
            IndexSearcher searcher = SearchUtil.getIndexSearcherByParentPath("index", null);
            String[] strs = SearchUtil.highlighter(searcher, "content", "lucene", "<font color=\"red\">", "</font>", 20);
            for (String str : strs) {
                System.out.println(str);
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
}
