import ob from "obseriot";
import {HumanStore, HumanEvent} from "../../lib/Human";

<page1>
  <p>男の人が額縁の絵を壁にかけようとしています。</p>
  <figure class="image">
    <image src="img/kaiga.png">
  </figure>

  <script>
    ob.listen(HumanEvent.Born, ()=>{
      console.log("He was born");
    });

    ob.listen(HumanEvent.Living, ()=>{
      console.log("He is living");
    });

    ob.listen(HumanEvent.Dead, ()=>{
      console.log("He was Dead");
    });
    
    this.on("mount", ()=>{
      HumanStore.startLife();
    });
  </script>
</page1>