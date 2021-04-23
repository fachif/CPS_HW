within CourseExamples.Workshop8.Electrical.Experiments;
model IdealAmplifierCircuit
  Components.IdealOpAmp idealOpAmp
    annotation (Placement(transformation(extent={{-20,4},{0,24}})));
  Modelica.Electrical.Analog.Sources.SineVoltage sineVoltage(V=8, freqHz=1000)
    annotation (Placement(transformation(extent={{-60,-30},{-40,-10}})));
  Modelica.Electrical.Analog.Basic.Resistor R1(R=10000)
    annotation (Placement(transformation(extent={{-60,10},{-40,30}})));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{-30,-60},{-10,-40}})));
  Modelica.Electrical.Analog.Basic.Resistor R2(R=40000)
    annotation (Placement(transformation(extent={{-20,28},{0,48}})));
  Modelica.Electrical.Analog.Basic.Resistor R3(R=10000) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={52,-14})));
equation
  connect(sineVoltage.n, ground.p)
    annotation (Line(points={{-40,-20},{-20,-20},{-20,-40}}, color={0,0,255}));
  connect(sineVoltage.p, R1.p) annotation (Line(points={{-60,-20},{-68,-20},{
          -68,20},{-60,20}}, color={0,0,255}));
  connect(R1.n, idealOpAmp.pin_n) annotation (Line(points={{-40,20},{-30,20},{
          -30,21},{-20.4,21}}, color={0,0,255}));
  connect(idealOpAmp.pin_p, ground.p)
    annotation (Line(points={{-20.4,7},{-20,-20},{-20,-40}}, color={0,0,255}));
  connect(R3.n, ground.p)
    annotation (Line(points={{52,-24},{-20,-24},{-20,-40}}, color={0,0,255}));
  connect(R2.p, idealOpAmp.pin_n) annotation (Line(points={{-20,38},{-20,30},{
          -20,21},{-20.4,21}}, color={0,0,255}));
  connect(R2.n, idealOpAmp.out) annotation (Line(points={{0,38},{-2,38},{-2,14},
          {-3.6,14}}, color={0,0,255}));
  connect(idealOpAmp.out, R3.p)
    annotation (Line(points={{-3.6,14},{52,14},{52,-4}}, color={0,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end IdealAmplifierCircuit;
