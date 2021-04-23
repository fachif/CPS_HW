within CourseExamples.Workshop8.Coil.Experiments;
model MagneticForceTest
  Components.Stroke stroke annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={10,-14})));
  Modelica.Mechanics.Translational.Components.Fixed fixed annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={10,-40})));
  Modelica.Mechanics.Translational.Components.Mass mass(m=0.01, v(start=1))
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={50,10})));
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
    magnet(V_m=1500)
    annotation (Placement(transformation(extent={{-60,40},{-40,60}})));
  Modelica.Magnetic.FluxTubes.Shapes.Leakage.HalfCylinder leakage(l=0.04)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-70,10})));
  Modelica.Magnetic.FluxTubes.Basic.Ground ground
    annotation (Placement(transformation(extent={{-80,-80},{-60,-60}})));
  Modelica.Mechanics.Translational.Sources.ForceStep load(
    useSupport=true,
    stepForce=1,
    offsetForce=-1,
    startTime=0.25) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={82,10})));
equation
  connect(stroke.mount, fixed.flange) annotation (Line(points={{10,-18},{10,-40}},
                            color={0,127,0}));
  connect(stroke.flange, mass.flange_a)
    annotation (Line(points={{10,-8},{10,10},{40,10}},
                                                 color={0,127,0}));
  connect(leakage.port_p, magnet.port_p) annotation (Line(points={{-70,20},{-66,
          20},{-66,50},{-60,50}}, color={255,127,0}));
  connect(ground.port, leakage.port_n) annotation (Line(points={{-70,-60},{-70,
          -3.55271e-15}}, color={255,127,0}));
  connect(magnet.port_n, flux.port_n) annotation (Line(points={{-40,50},{-36,50},
          {-36,48},{-30,48},{-30,20}}, color={255,127,0}));
  connect(flux.port_p, leakage.port_n) annotation (Line(points={{-30,0},{-30,
          -48},{-70,-48},{-70,-3.55271e-15}}, color={255,127,0}));
  connect(load.flange, mass.flange_b)
    annotation (Line(points={{72,10},{60,10}}, color={0,127,0}));
  connect(load.support, fixed.flange) annotation (Line(points={{82,0},{82,-34},
          {10,-34},{10,-40}}, color={0,127,0}));
  connect(flux.flange, mass.flange_a)
    annotation (Line(points={{-20,10},{40,10}}, color={0,127,0}));
  connect(flux.support, fixed.flange) annotation (Line(points={{-40,10},{-44,10},
          {-44,-34},{10,-34},{10,-40}}, color={0,127,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end MagneticForceTest;
