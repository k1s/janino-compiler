package hexlet;

import org.codehaus.commons.compiler.CompileException;
import org.codehaus.janino.Compiler;

import java.io.File;
import java.io.IOException;

public class Janino {

    public static void main(String[] args) throws IOException, CompileException {
        String path = args[0];
        Compiler compiler = new Compiler();
        File[] fs = {new File(path)};
        compiler.compile(fs);
    }

}
