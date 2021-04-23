within CourseExamples.Workshop9.StateGraph;
model Lamp
  Modelica_StateGraph2.Step SwitchIsOn(
    use_activePort=true,
    nIn=1,
    nOut=1) annotation (Placement(transformation(extent={{-44,-40},{-36,-32}})));
  Modelica_StateGraph2.Step SwitchIsOff(
    initialStep=true,
    use_activePort=false,
    nOut=1,
    nIn=1) annotation (Placement(transformation(extent={{-44,24},{-36,32}})));
  Modelica_StateGraph2.Transition SwitchOff(use_conditionPort=true) annotation (
     Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=180,
        origin={26,2})));
  Modelica_StateGraph2.LoopBreakingTransition SwitchOn(use_conditionPort=true)
    annotation (Placement(transformation(extent={{-44,-6},{-36,2}})));
  Modelica_StateGraph2.Blocks.MathBoolean.ChangingEdge changing1
    annotation (Placement(transformation(extent={{-68,-4},{-60,4}})));
  Modelica_StateGraph2.Blocks.MathBoolean.ShowValue showValue
    annotation (Placement(transformation(extent={{42,-46},{62,-26}})));
  Modelica_StateGraph2.Blocks.Interactive.ToggleButton LightSwitch
    annotation (Placement(transformation(extent={{-98,-10},{-78,10}})));
equation
  connect(LightSwitch.y, changing1.u)
    annotation (Line(points={{-78,0},{-69.2,0}}, color={255,0,255}));
  connect(changing1.y, SwitchOn.conditionPort)
    annotation (Line(points={{-59.2,0},{-45,0}}, color={255,0,255}));
  connect(SwitchOn.outPort, SwitchIsOn.inPort[1])
    annotation (Line(points={{-40,-7.8},{-40,-32}}, color={0,0,0}));
  connect(SwitchIsOff.outPort[1], SwitchOn.inPort)
    annotation (Line(points={{-40,23.4},{-40,2}}, color={0,0,0}));
  connect(SwitchIsOff.inPort[1], SwitchOff.outPort) annotation (Line(points={{
          -40,32},{-40,60},{26,60},{26,7}}, color={0,0,0}));
  connect(SwitchIsOn.outPort[1], SwitchOff.inPort) annotation (Line(points={{
          -40,-40.6},{-40,-60},{26,-60},{26,-2}}, color={0,0,0}));
  connect(showValue.activePort, SwitchIsOn.activePort)
    annotation (Line(points={{40.5,-36},{-35.28,-36}}, color={255,0,255}));
  connect(SwitchOff.conditionPort, SwitchOn.conditionPort) annotation (Line(
        points={{31,2},{44,2},{44,16},{-52,16},{-52,0},{-45,0}}, color={255,0,
          255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Lamp;
