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

    public static void main(String[] args) {

//		SelectQuery("cach",1);  //通配符查找
        SelectQuery("cach", 2); //精确查找

    }

    static void SelectQuery(String text, int num) {

        String indexDir = "/Users/huiyu/Downloads/lucene/index";
        try {

            FSDirectory fsDirectory = FSDirectory.open(Paths.get(indexDir));

            IndexReader reader = DirectoryReader.open(fsDirectory);

            IndexSearcher searcher = new IndexSearcher(reader);

            Query query = null;

            if (num == 1) {
                query = WildCardcreatQuery(text);
            }
            if (num == 2) {
                query = creatQuery(text);
            }

            TopDocs docs = searcher.search(query, 10);

            if (docs.totalHits == 0)

                System.out.println("Not found");

            else {

                for (ScoreDoc scoreDoc : docs.scoreDocs) {

//				System.out.println(scoreDoc.score);
                    System.out.println(searcher.doc(scoreDoc.doc).get("name"));

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

    static Query WildCardcreatQuery(String text) {
        WildcardQuery query = new WildcardQuery(new Term("name", "*" + text + "*"));
        return query;
    }

}
