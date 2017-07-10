import ob from "obseriot";

export const HumanStore = new class HumanStore {
  constructor() {

  }

  startLife() {
    ob.notify(HumanEvent.Born);
    const t = Date.now();
    const intervalId = setInterval(()=>{
      if(Date.now() > t + 5000) {
        clearInterval(intervalId);
        ob.notify(HumanEvent.Dead);
        return;
      }
      ob.notify(HumanEvent.Living);
    } , 1000);
  }
}

export const HumanEvent = {
  Born: {
    handler: {
      name: "human.born",
      action: () => {}
    }
  },
  Living: {
    handler: {
      name: "human.living",
      action: () => {}
    }    
  },
  Dead: {
    handler: {
      name: "human.dead",
      action: () => {}
    }
  }
}