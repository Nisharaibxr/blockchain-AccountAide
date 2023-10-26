import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor project1 {
  stable var currentValue: Float =300;
  currentValue := 300;

  Debug.print(debug_show(currentValue));



  stable var startTime = Time.now();
  startTime := Time.now();
  Debug.print(debug_show(startTime));



  let id = 234;
  public func topUp(amount: Float){
    currentValue += amount;
    Debug.print(debug_show(currentValue));

  };

   public func withdraw(amount: Float){
     let tempValue: Float = currentValue - amount;
     if(tempValue >= 0){
      currentValue -= amount;
      Debug.print(debug_show(currentValue));

     }else{
      Debug.print("Amount too large, currentValue less than zero.")
     }
  };
 public query func checkBalance():async Float {
 return currentValue;
 };

 public func compound() {
  let currentTime = Time.now();
  let timeElapsedNS = currentTime - startTime;
  let timeElapsedS = timeElapsedNS / 1_000_000_000;

  let interestRate = 0.01;
  let growthFactor = 1.0 + interestRate;
  currentValue := currentValue * growthFactor;

  startTime := currentTime;
};


}
