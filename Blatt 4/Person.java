public interface Person {
  public String getForename();
  public String getSurename();
  public Person getMother() throws UnknownMother;
  public boolean agrees();
}