
import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.pattern.PatternTokenizer;

import java.util.regex.Pattern;


public class PatternAnalyzer extends Analyzer {
    @Override
    protected TokenStreamComponents createComponents(String s) {
        return new TokenStreamComponents(new PatternTokenizer(Pattern.compile("\\."),-1));
    }
}
