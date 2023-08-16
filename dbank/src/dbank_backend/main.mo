// When ever we are using the deploy all the variable are get wiped out and value get rest.
// class is called as actor method in motoku
// Creating a new actor is a good as creating a new cansistor

//Synchronous single track multiple train and ASynchronous multiple track multiple train.
//Update call go through the blockchain.

import Debug "mo:base/Debug"; //For Print Functions
import Time "mo:base/Time"; //For Time Functions
import Float "mo:base/Float";
actor DBank {
  //Var is used as a variable.
  stable var currentValue: Float = 300;
  // currentValue := 300;
  // Debug.print(debug_show(currentValue));
  //Let is used as a constant(Hold data that never Change) in javascript.

  //Show time in nano seconds.
  stable var startTime=Time.now();
  // startTime:=Time.now();
  // Debug.print(debug_show(startTime));

  let id = 12312343245454353;

  //Debug.print() Accepting String for Printing but we are passing natural number so we need use debug_show function for printing natural number.
  // Debug.print(debug_show (currentValue));
  // Debug.print("Hello");

  // Debug.print(debug_show(id));

  // In Motoku function is creating using a func keyword. and we have to close a function using a semicolon(;).
  //This is a private function which is only accessible inside this Actor class.
  public func topUp(amount : Float) {
    currentValue += amount;

    Debug.print(debug_show (currentValue));
  };

  public func withdrawal(amount : Float) {
      //After Computation the type can be change so we are making sure that the type is Int. (let tempValue:Int)
      let tempValue: Float=currentValue -amount;
      //Condition Statement.
    if ( tempValue >= 0) {
      // We are Updating the State so it will take more time.
      //We are writing to the block chain.
      currentValue -= amount;
      Debug.print(debug_show (currentValue));
    }
    else{
      Debug.print("Amount too large, currentValue less than zero.");
    }
  };

  //we are querying the current state.
  //Read only value

  //If we are having the output the output must be async and after the datatype must come.
  public query func checkBalance(): async Float {
    return currentValue;
  };


  //Functions Calling.
  //topUp();

  public func compound() {
    let currentTime=Time.now();
    let timeElapsedNS=currentTime -startTime; //Nanoseconds
    let timeElapsedS=timeElapsedNS/1000000000;  //Seconds 
    //** Power
    currentValue:= currentValue *(1.01 ** Float.fromInt(timeElapsedS));

    startTime:=currentTime;
  }
};


// Deploy to network

// dfx Deploy --network ic

// dfx canister --network ic id dbank_frontend