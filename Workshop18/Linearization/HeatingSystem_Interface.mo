within CourseExamples.Workshop18.Linearization;
partial model HeatingSystem_Interface
  Modelica.Blocks.Interfaces.RealInput dQ_flow
    annotation (Placement(transformation(extent={{-200,50},{-160,90}})));
  Modelica.Blocks.Interfaces.RealInput du
    annotation (Placement(transformation(extent={{-200,-90},{-160,-50}})));
  Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{-120,60},{-100,80}})));
  Modelica.Blocks.Math.Add add1
    annotation (Placement(transformation(extent={{-120,-80},{-100,-60}})));
  Modelica.Blocks.Sources.Constant Q_0(k=Q0)
    annotation (Placement(transformation(extent={{-154,40},{-134,60}})));
  Modelica.Blocks.Sources.Constant u_0(k=u0)
    annotation (Placement(transformation(extent={{-154,-100},{-134,-80}})));
    parameter Real Q0 = 300;
    parameter Real u0 = 0.1;

  Modelica.Blocks.Interfaces.RealOutput T_forward
    annotation (Placement(transformation(extent={{100,60},{120,80}})));
  Modelica.Blocks.Interfaces.RealOutput T_return
    annotation (Placement(transformation(extent={{100,-80},{120,-60}})));
equation
  connect(add.u1, dQ_flow) annotation (Line(points={{-122,76},{-142,76},{-142,
          70},{-180,70}},
                     color={0,0,127}));
  connect(add1.u1, du) annotation (Line(points={{-122,-64},{-142,-64},{-142,-70},
          {-180,-70}},
                 color={0,0,127}));
  connect(Q_0.y, add.u2) annotation (Line(points={{-133,50},{-130,50},{-130,64},
          {-122,64}},
                color={0,0,127}));
  connect(u_0.y, add1.u2) annotation (Line(points={{-133,-90},{-128,-90},{-128,
          -76},{-122,-76}},
                      color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-160,
            -100},{100,100}})),                                  Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-160,-100},{100,
            100}})));
end HeatingSystem_Interface;
