 import { project1_backend} from "../../declarations/project1_backend";


 window.addEventListener("load", async function(){
   update();
 });

 document.querySelector("form").addEventListener("submit", async function(event){
    event.preventDefault();
    //console.log("Submitted.");
  
    const button=  event.target.querySelector("#submit-btn");

    const inputAmount = parseFloat(document.getElementById("input-amount").value);
    const outputAmount = parseFloat(document.getElementById("withdrawal-amount").value);

    
 
    if(document.getElementById("input-amount").value.length != 0){
        await project1_backend.topUp(inputAmount);
    }

    if(document.getElementById("withdrawal-amount").value.length != 0){
        await project1_backend.withdraw(outputAmount);
    }
 
    await project1_backend.compound();
 
    update()

    document.getElementById("input-amount").value ="";
    document.getElementById("withdrawal-amount").value ="";

    button.removeAttribute("disabled");

});

async function update(){
    const currentAmount = await project1_backend.checkBalance();
    document.getElementById("value").innerText = Math.round(currentAmount * 100)/ 100;
}

 
