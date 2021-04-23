within CourseExamples.Workshop8.Coil.Experiments;
model ElectroMagneticPositioning
  Components.Stroke stroke annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-10,-2})));
  Modelica.Mechanics.Translational.Components.Fixed fixed annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={10,-40})));
  Modelica.Mechanics.Translational.Components.Mass mass(m=0.01, v(start=0))
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={10,10})));
  Modelica.Magnetic.FluxTubes.Shapes.Force.HollowCylinderRadialFlux flux(
    useSupport=true,
    mu_r=1.05,
    l=max(0.001, 0.021 - stroke.flange.s),
    r_i=0.01,
    r_o=0.02) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-30,10})));
  Modelica.Magnetic.FluxTubes.Sources.ConstantMagneticPotentialDifference
    magnet(V_m=10)
    annotation (Placement(transformation(extent={{-58,20},{-38,40}})));
  Modelica.Magnetic.FluxTubes.Shapes.Leakage.HalfCylinder leakage(l=0.04)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-70,10})));
  Modelica.Magnetic.FluxTubes.Basic.Ground ground
    annotation (Placement(transformation(extent={{-110,-40},{-90,-20}})));
  Modelica.Mechanics.Translational.Sources.ForceStep load(
    useSupport=true,
    stepForce=-1,
    offsetForce=0,
    startTime=0.25) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={38,10})));
  Modelica.Magnetic.FluxTubes.Basic.ElectroMagneticConverter coil(N=100)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-50,-24})));
  Modelica.Electrical.Spice3.Basic.R_Resistor r_Resistor(R=0.01)
    annotation (Placement(transformation(extent={{-64,-70},{-44,-50}})));
  Modelica.Electrical.Analog.Basic.Ground ground1
    annotation (Placement(transformation(extent={{-40,-94},{-20,-74}})));
  Modelica.Electrical.Analog.Sources.PulseVoltage pulseVoltage(
    V=3,
    width=33,
    period=0.1,
    offset=0,
    startTime=0.5) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-78,-48})));
equation
  connect(stroke.mount, fixed.flange) annotation (Line(points={{-10,-6},{-10,
          -24},{10,-24},{10,-40}},
                            color={0,127,0}));
  connect(stroke.flange, mass.flange_a)
    annotation (Line(points={{-10,4},{-10,10},{0,10}},
                                                 color={0,127,0}));
  connect(leakage.port_p, magnet.port_p) annotation (Line(points={{-70,20},{-66,
          20},{-66,30},{-58,30}}, color={255,127,0}));
  connect(ground.port, leakage.port_n) annotation (Line(points={{-100,-20},{
          -100,-14},{-70,-14},{-70,-3.55271e-15}}, color={255,127,0}));
  connect(magnet.port_n, flux.port_n)
    annotation (Line(points={{-38,30},{-30,30},{-30,20}}, color={255,127,0}));
  connect(load.flange, mass.flange_b)
    annotation (Line(points={{28,10},{20,10}}, color={0,127,0}));
  connect(load.support, fixed.flange) annotation (Line(points={{38,0},{38,-10},
          {10,-10},{10,-40}}, color={0,127,0}));
  connect(flux.flange, mass.flange_a)
    annotation (Line(points={{-20,10},{0,10}}, color={0,127,0}));
  connect(flux.support, fixed.flange) annotation (Line(points={{-40,10},{-46,10},
          {-46,-10},{10,-10},{10,-40}}, color={0,127,0}));
  connect(coil.port_n, flux.port_p)
    annotation (Line(points={{-44,-14},{-30,-14},{-30,0}}, color={255,127,0}));
  connect(coil.port_p, leakage.port_n) annotation (Line(points={{-56,-14},{-70,
          -14},{-70,-3.55271e-15}}, color={255,127,0}));
  connect(coil.n, r_Resistor.n) annotation (Line(points={{-44,-34},{-30,-34},{
          -30,-60},{-44,-60}}, color={0,0,255}));
  connect(ground1.p, r_Resistor.n)
    annotation (Line(points={{-30,-74},{-30,-60},{-44,-60}}, color={0,0,255}));
  connect(coil.p, pulseVoltage.p)
    annotation (Line(points={{-56,-34},{-78,-34},{-78,-38}}, color={0,0,255}));
  connect(r_Resistor.p, pulseVoltage.n)
    annotation (Line(points={{-64,-60},{-78,-60},{-78,-58}}, color={0,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-120,
            -140},{120,100}})),                                  Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-120,-140},{120,
            100}})));
end ElectroMagneticPositioning;
