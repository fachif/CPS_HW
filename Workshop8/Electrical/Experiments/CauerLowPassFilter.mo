within CourseExamples.Workshop8.Electrical.Experiments;
model CauerLowPassFilter
  parameter Modelica.SIunits.Capacitance i1=1.304 "filter coefficient i1";
  parameter Modelica.SIunits.Capacitance i2=0.8586 "filter coefficient i2";
  parameter Modelica.SIunits.Capacitance c1=1.072 "filter coefficient c1";
  parameter Modelica.SIunits.Capacitance c2=1/(1.704992^2*i1) "filter coefficient c2";
  parameter Modelica.SIunits.Capacitance c3=1.682 "filter coefficient c3";
  parameter Modelica.SIunits.Capacitance c4=1/(1.179945^2*i2) "filter coefficient c4";
  parameter Modelica.SIunits.Capacitance c5=0.7262 "filter coefficient c5";
  Modelica.Electrical.Analog.Basic.Ground G1
    annotation (Placement(transformation(extent={{-56,-62},{-36,-42}})));
  Modelica.Electrical.Analog.Basic.Resistor R1
    annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
  Modelica.Electrical.Analog.Basic.Capacitor C1(C=c1 + c2)
    annotation (Placement(transformation(extent={{-40,10},{-20,30}})));
  Components.IdealOpAmp Op1
    annotation (Placement(transformation(extent={{-40,-20},{-16,4}})));
  Modelica.Electrical.Analog.Basic.Ground G2
    annotation (Placement(transformation(extent={{10,-60},{30,-40}})));
  Modelica.Electrical.Analog.Basic.Resistor R2(R=-1)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Electrical.Analog.Basic.Capacitor C2(C=i1)
    annotation (Placement(transformation(extent={{30,10},{50,30}})));
  Components.IdealOpAmp Op2
    annotation (Placement(transformation(extent={{30,-20},{54,4}})));
  Modelica.Electrical.Analog.Basic.Ground G3
    annotation (Placement(transformation(extent={{84,-60},{104,-40}})));
  Modelica.Electrical.Analog.Basic.Resistor R3
    annotation (Placement(transformation(extent={{64,-10},{84,10}})));
  Modelica.Electrical.Analog.Basic.Capacitor C3(C=c2 + c3 + c4)
    annotation (Placement(transformation(extent={{104,10},{124,30}})));
  Components.IdealOpAmp Op3
    annotation (Placement(transformation(extent={{104,-20},{128,4}})));
  Modelica.Electrical.Analog.Basic.Ground G4
    annotation (Placement(transformation(extent={{160,-60},{180,-40}})));
  Modelica.Electrical.Analog.Basic.Resistor R4(R=-1)
    annotation (Placement(transformation(extent={{140,-10},{160,10}})));
  Modelica.Electrical.Analog.Basic.Capacitor C4(C=i2)
    annotation (Placement(transformation(extent={{180,10},{200,30}})));
  Components.IdealOpAmp Op4
    annotation (Placement(transformation(extent={{180,-20},{204,4}})));
  Modelica.Electrical.Analog.Basic.Ground G5
    annotation (Placement(transformation(extent={{230,-60},{250,-40}})));
  Modelica.Electrical.Analog.Basic.Resistor R5
    annotation (Placement(transformation(extent={{210,-10},{230,10}})));
  Modelica.Electrical.Analog.Basic.Capacitor C5(C=c4 + c5)
    annotation (Placement(transformation(extent={{250,10},{270,30}})));
  Components.IdealOpAmp Op5
    annotation (Placement(transformation(extent={{250,-20},{274,4}})));
  Modelica.Electrical.Analog.Basic.Resistor R6
    annotation (Placement(transformation(extent={{-72,10},{-52,30}})));
  Modelica.Electrical.Analog.Basic.Resistor R7
    annotation (Placement(transformation(extent={{-40,34},{-20,54}})));
  Modelica.Electrical.Analog.Basic.Resistor R8(R=-1)
    annotation (Placement(transformation(extent={{140,10},{160,30}})));
  Modelica.Electrical.Analog.Basic.Resistor R9
    annotation (Placement(transformation(extent={{250,40},{270,60}})));
  Modelica.Electrical.Analog.Basic.Capacitor C6(C=c2)
                                                annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-76,-90})));
  Modelica.Electrical.Analog.Basic.Capacitor C7(C=c2)
    annotation (Placement(transformation(extent={{20,-80},{40,-60}})));
  Modelica.Electrical.Analog.Basic.Capacitor C8(C=c4)
    annotation (Placement(transformation(extent={{104,60},{124,80}})));
  Modelica.Electrical.Analog.Basic.Capacitor C9(C=c4)
    annotation (Placement(transformation(extent={{162,-110},{182,-90}})));
  Modelica.Electrical.Analog.Basic.Resistor R10(R=-1)
    annotation (Placement(transformation(extent={{-50,-90},{-30,-70}})));
  Modelica.Electrical.Analog.Basic.Resistor R11
    annotation (Placement(transformation(extent={{76,10},{96,30}})));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{-132,-78},{-112,-58}})));
  Modelica.Electrical.Analog.Sources.SineVoltage sineVoltage(
    V=1,
    freqHz=10,
    offset=1,
    startTime=1)                                             annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-122,-22})));
equation
  connect(C1.p, Op1.pin_n) annotation (Line(points={{-40,20},{-40,0.4},{-40.48,0.4}},
        color={0,0,255}));
  connect(C1.n, Op1.out) annotation (Line(points={{-20,20},{-20,6},{-20,-8},{-20.32,
          -8}}, color={0,0,255}));
  connect(R1.n, Op1.pin_n) annotation (Line(points={{-60,0},{-50,0},{-50,0.4},{-40.48,
          0.4}}, color={0,0,255}));
  connect(G1.p, Op1.pin_p) annotation (Line(points={{-46,-42},{-46,-16.4},{-40.48,
          -16.4}}, color={0,0,255}));
  connect(C2.p, Op2.pin_n)
    annotation (Line(points={{30,20},{30,0.4},{29.52,0.4}}, color={0,0,255}));
  connect(C2.n, Op2.out)
    annotation (Line(points={{50,20},{50,-8},{49.68,-8}}, color={0,0,255}));
  connect(R2.n, Op2.pin_n) annotation (Line(points={{10,0},{20,0},{20,0.4},{29.52,
          0.4}}, color={0,0,255}));
  connect(G2.p, Op2.pin_p) annotation (Line(points={{20,-40},{24,-40},{24,-16.4},
          {29.52,-16.4}}, color={0,0,255}));
  connect(C3.p, Op3.pin_n) annotation (Line(points={{104,20},{104,0.4},{103.52,0.4}},
        color={0,0,255}));
  connect(C3.n, Op3.out)
    annotation (Line(points={{124,20},{124,-8},{123.68,-8}}, color={0,0,255}));
  connect(R3.n, Op3.pin_n) annotation (Line(points={{84,0},{94,0},{94,0.4},{103.52,
          0.4}}, color={0,0,255}));
  connect(G3.p, Op3.pin_p) annotation (Line(points={{94,-40},{98,-40},{98,-16.4},
          {103.52,-16.4}}, color={0,0,255}));
  connect(C4.p, Op4.pin_n) annotation (Line(points={{180,20},{180,0.4},{179.52,0.4}},
        color={0,0,255}));
  connect(C4.n, Op4.out)
    annotation (Line(points={{200,20},{200,-8},{199.68,-8}}, color={0,0,255}));
  connect(R4.n, Op4.pin_n) annotation (Line(points={{160,0},{170,0},{170,0.4},{179.52,
          0.4}}, color={0,0,255}));
  connect(G4.p, Op4.pin_p) annotation (Line(points={{170,-40},{174,-40},{174,-16.4},
          {179.52,-16.4}}, color={0,0,255}));
  connect(Op1.out, R2.p) annotation (Line(points={{-20.32,-8},{-16,-8},{-16,0},{
          -10,0}}, color={0,0,255}));
  connect(Op2.out, R3.p) annotation (Line(points={{49.68,-8},{56,-8},{56,0},{64,
          0}}, color={0,0,255}));
  connect(Op3.out, R4.p) annotation (Line(points={{123.68,-8},{130,-8},{130,0},{
          140,0}}, color={0,0,255}));
  connect(C5.p, Op5.pin_n) annotation (Line(points={{250,20},{250,0.4},{249.52,0.4}},
        color={0,0,255}));
  connect(C5.n, Op5.out)
    annotation (Line(points={{270,20},{270,-8},{269.68,-8}}, color={0,0,255}));
  connect(R5.n, Op5.pin_n) annotation (Line(points={{230,0},{240,0},{240,0.4},{249.52,
          0.4}}, color={0,0,255}));
  connect(G5.p, Op5.pin_p) annotation (Line(points={{240,-40},{244,-40},{244,-16.4},
          {249.52,-16.4}}, color={0,0,255}));
  connect(Op4.out, R5.p) annotation (Line(points={{199.68,-8},{204,-8},{204,0},{
          210,0}}, color={0,0,255}));
  connect(R6.n, C1.p)
    annotation (Line(points={{-52,20},{-40,20}}, color={0,0,255}));
  connect(R6.p, C2.n) annotation (Line(points={{-72,20},{-76,20},{-76,22},{-80,22},
          {-80,80},{58,80},{58,20},{50,20}}, color={0,0,255}));
  connect(C1.p, R7.p)
    annotation (Line(points={{-40,20},{-40,44},{-40,44}}, color={0,0,255}));
  connect(R7.n, C1.n)
    annotation (Line(points={{-20,44},{-20,20}}, color={0,0,255}));
  connect(C6.n, Op1.pin_n) annotation (Line(points={{-76,-80},{-76,-20},{-54,-20},
          {-54,0.4},{-40.48,0.4}}, color={0,0,255}));
  connect(R10.p, C6.p) annotation (Line(points={{-50,-80},{-64,-80},{-64,-100},{
          -76,-100}}, color={0,0,255}));
  connect(R10.n, R2.n)
    annotation (Line(points={{-30,-80},{10,-80},{10,0}}, color={0,0,255}));
  connect(C7.p, Op1.out) annotation (Line(points={{20,-70},{-20.32,-70},{-20.32,
          -8}}, color={0,0,255}));
  connect(C7.n, R3.n)
    annotation (Line(points={{40,-70},{84,-70},{84,0}}, color={0,0,255}));
  connect(C9.p, C6.p) annotation (Line(points={{162,-100},{-76,-100}},
                  color={0,0,255}));
  connect(C9.n, R5.n)
    annotation (Line(points={{182,-100},{230,-100},{230,0}},
                                                           color={0,0,255}));
  connect(C8.p, C3.p)
    annotation (Line(points={{104,70},{104,20}}, color={0,0,255}));
  connect(R8.n, C4.p)
    annotation (Line(points={{160,20},{180,20}}, color={0,0,255}));
  connect(C5.p, R9.p)
    annotation (Line(points={{250,20},{250,50}}, color={0,0,255}));
  connect(C5.n, R9.n)
    annotation (Line(points={{270,20},{270,50}}, color={0,0,255}));
  connect(C8.n, R9.n)
    annotation (Line(points={{124,70},{270,70},{270,50}}, color={0,0,255}));
  connect(R8.p, R9.n) annotation (Line(points={{140,20},{140,70},{270,70},{270,50}},
        color={0,0,255}));
  connect(Op3.out, C6.p) annotation (Line(points={{123.68,-8},{124,-8},{124,-100},
          {-76,-100}}, color={0,0,255}));
  connect(R11.n, C3.p)
    annotation (Line(points={{96,20},{104,20}}, color={0,0,255}));
  connect(R11.p, C4.n) annotation (Line(points={{76,20},{76,80},{200,80},{200,20}},
        color={0,0,255}));
  connect(ground.p, sineVoltage.p)
    annotation (Line(points={{-122,-58},{-122,-32}}, color={0,0,255}));
  connect(sineVoltage.n, R1.p)
    annotation (Line(points={{-122,-12},{-122,0},{-80,0}}, color={0,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-140,-120},
            {280,100}})), Diagram(coordinateSystem(preserveAspectRatio=false,
          extent={{-140,-120},{280,100}})));
end CauerLowPassFilter;
