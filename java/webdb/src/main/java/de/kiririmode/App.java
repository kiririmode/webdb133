package de.kiririmode;

/**
 * Checkstye の定めるインデントと敢えてずらすことで、Checkstyle の violation を発生させている
 */
public class App {

    public static void main(String[] args) {
        System.out.println("Hello World!");
    }

    /**
     * 敢えて Spotbugs の NP_BOOLEAN_RETURN_NULL に違反したメソッド
     *
     * @return null
     */
    public Boolean isDummy() {
        return null;
    }
}
