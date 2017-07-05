public class Subtypes {
  public static class A implements E, I {}
  public static interface B extends E, I {}
  public static abstract class C implements E, I  {}
  public static class D extends C {}
  public static interface E {}
  public static class F extends D {}
  public static class G extends A implements B {}
  public static abstract class H extends C {}
  public static interface I {}
}