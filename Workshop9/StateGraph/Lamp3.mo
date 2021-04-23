within CourseExamples.Workshop9.StateGraph;
model Lamp3
  Modelica_StateGraph2.Step SwitchIsOn(
    use_activePort=true,
    nIn=1,
    nOut=1) annotation (Placement(transformation(extent={{-44,-40},{-36,-32}})));
  Modelica_StateGraph2.Step SwitchIsOff(
    initialStep=false,
    use_activePort=false,
    nOut=1,
    nIn=2) annotation (Placement(transformation(extent={{-44,24},{-36,32}})));
  Modelica_StateGraph2.Transition SwitchOff(use_conditionPort=true) annotation (
     Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=180,
        origin={26,2})));
  Modelica_StateGraph2.LoopBreakingTransition SwitchOn(use_conditionPort=true)
    annotation (Placement(transformation(extent={{-44,-6},{-36,2}})));
  Modelica_StateGraph2.Blocks.MathBoolean.ChangingEdge changing1
    annotation (Placement(transformation(extent={{-94,66},{-86,74}})));
  Modelica_StateGraph2.Blocks.MathBoolean.ShowValue showValue
    annotation (Placement(transformation(extent={{116,-60},{166,-12}})));
  Modelica_StateGraph2.Blocks.Interactive.ToggleButton LightSwitch
    annotation (Placement(transformation(extent={{-132,60},{-112,80}})));
  Modelica_StateGraph2.Parallel poweravailable(
    initialStep=true,
    use_inPort=false,
    use_outPort=false,
    use_suspend=true,
    nEntry=1,
    nResume=1,
    nSuspend=1)
    annotation (Placement(transformation(extent={{-68,-78},{64,82}})));
  Modelica_StateGraph2.Blocks.Interactive.ToggleButton PLUG
    annotation (Placement(transformation(extent={{-136,-52},{-116,-32}})));
  Modelica_StateGraph2.Blocks.MathBoolean.ChangingEdge changing2
    annotation (Placement(transformation(extent={{-104,-46},{-96,-38}})));
  Modelica_StateGraph2.Step SwitchIsOff1(
    initialStep=false,
    use_activePort=false,
    nOut=1,
    nIn=1) annotation (Placement(transformation(extent={{-90,0},{-82,8}})));
  Modelica_StateGraph2.LoopBreakingTransition plug(use_conditionPort=true)
    annotation (Placement(transformation(extent={{-90,-48},{-82,-40}})));
  Modelica_StateGraph2.Transition unplug(use_conditionPort=true) annotation (
      Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=0,
        origin={-86,34})));
  Modelica_StateGraph2.Blocks.MathBoolean.And and1(nu=2)
    annotation (Placement(transformation(extent={{76,-42},{88,-30}})));
  Modelica_StateGraph2.Blocks.Interactive.ToggleButton REPLACE
    annotation (Placement(transformation(extent={{-136,-150},{-116,-130}})));
  Modelica_StateGraph2.Step bulbisbroken(
    initialStep=false,
    use_activePort=false,
    nOut=1,
    nIn=1)
    annotation (Placement(transformation(extent={{-34,-116},{-26,-108}})));
  Modelica_StateGraph2.LoopBreakingTransition SwitchOn1(use_conditionPort=true)
    annotation (Placement(transformation(extent={{-34,-146},{-26,-138}})));
  Modelica_StateGraph2.Step bulbIsWorking(
    initialStep=true,
    use_activePort=true,
    nIn=1,
    nOut=1)
    annotation (Placement(transformation(extent={{-34,-178},{-26,-170}})));
  Modelica_StateGraph2.Transition breakbulb(use_conditionPort=true) annotation (
     Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=180,
        origin={36,-138})));
  Modelica_StateGraph2.Blocks.Interactive.ToggleButton BREAK annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={122,-138})));
equation
  connect(LightSwitch.y, changing1.u)
    annotation (Line(points={{-112,70},{-95.2,70}}, color={255,0,255}));
  connect(changing1.y, SwitchOn.conditionPort) annotation (Line(points={{-85.2,
          70},{-52,70},{-52,0},{-45,0}}, color={255,0,255}));
  connect(SwitchOn.outPort, SwitchIsOn.inPort[1])
    annotation (Line(points={{-40,-7.8},{-40,-32}}, color={0,0,0}));
  connect(SwitchIsOff.outPort[1], SwitchOn.inPort)
    annotation (Line(points={{-40,23.4},{-40,2}}, color={0,0,0}));
  connect(SwitchIsOff.inPort[1], SwitchOff.outPort) annotation (Line(points={{
          -41,32},{-41,60},{26,60},{26,7}}, color={0,0,0}));
  connect(SwitchIsOn.outPort[1], SwitchOff.inPort) annotation (Line(points={{
          -40,-40.6},{-40,-60},{26,-60},{26,-2}}, color={0,0,0}));
  connect(SwitchOff.conditionPort, SwitchOn.conditionPort) annotation (Line(
        points={{31,2},{44,2},{44,16},{-52,16},{-52,0},{-45,0}}, color={255,0,
          255}));
  connect(poweravailable.entry[1], SwitchIsOff.inPort[2]) annotation (Line(
        points={{-2,74},{-2,66},{-39,66},{-39,32}}, color={0,0,0}));
  connect(PLUG.y, changing2.u)
    annotation (Line(points={{-116,-42},{-105.2,-42}}, color={255,0,255}));
  connect(changing2.y, plug.conditionPort)
    annotation (Line(points={{-95.2,-42},{-91,-42}}, color={255,0,255}));
  connect(plug.inPort, SwitchIsOff1.outPort[1])
    annotation (Line(points={{-86,-40},{-86,-0.6}}, color={0,0,0}));
  connect(plug.outPort, poweravailable.resume[1]) annotation (Line(points={{-86,
          -49.8},{-86,-56},{-74,-56},{-74,-43},{-68,-43}}, color={0,0,0}));
  connect(unplug.outPort, SwitchIsOff1.inPort[1])
    annotation (Line(points={{-86,29},{-86,8}}, color={0,0,0}));
  connect(unplug.inPort, poweravailable.suspend[1]) annotation (Line(points={{
          -86,38},{-88,38},{-88,47},{-71.3,47}}, color={0,0,0}));
  connect(unplug.conditionPort, changing2.y) annotation (Line(points={{-91,34},
          {-95.2,34},{-95.2,-42}}, color={255,0,255}));
  connect(SwitchIsOn.activePort, and1.u[1]) annotation (Line(points={{-35.28,
          -36},{20,-36},{20,-33.9},{76,-33.9}}, color={255,0,255}));
  connect(and1.y, showValue.activePort)
    annotation (Line(points={{89.2,-36},{112.25,-36}}, color={255,0,255}));
  connect(SwitchOn1.inPort, bulbisbroken.outPort[1])
    annotation (Line(points={{-30,-138},{-30,-116.6}}, color={0,0,0}));
  connect(bulbisbroken.inPort[1], breakbulb.outPort) annotation (Line(points={{
          -30,-108},{-30,-94},{36,-94},{36,-133}}, color={0,0,0}));
  connect(SwitchOn1.outPort, bulbIsWorking.inPort[1])
    annotation (Line(points={{-30,-147.8},{-30,-170}}, color={0,0,0}));
  connect(bulbIsWorking.outPort[1], breakbulb.inPort) annotation (Line(points={
          {-30,-178.6},{2,-178.6},{2,-178},{36,-178},{36,-142}}, color={0,0,0}));
  connect(REPLACE.y, SwitchOn1.conditionPort)
    annotation (Line(points={{-116,-140},{-35,-140}}, color={255,0,255}));
  connect(BREAK.y, breakbulb.conditionPort)
    annotation (Line(points={{112,-138},{41,-138}}, color={255,0,255}));
  connect(bulbIsWorking.activePort, and1.u[2]) annotation (Line(points={{-25.28,
          -174},{-8,-174},{-8,-172},{10,-172},{10,-108},{76,-108},{76,-38.1}},
        color={255,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-140,
            -200},{140,100}})), Diagram(coordinateSystem(preserveAspectRatio=
            false, extent={{-140,-200},{140,100}})));
end Lamp3;
