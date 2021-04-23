within CourseExamples.Workshop8.House.Components;
model LayeredWall
  parameter Modelica.SIunits.ThermalConductance G_wall1 "Thermal Conductance of wall 1.";
  parameter Modelica.SIunits.ThermalConductance G_wall2 "Thermal Conductance of wall 2.";
  parameter Modelica.SIunits.HeatCapacity C_wall "Heat Capacity";
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a port_a
    annotation (Placement(transformation(extent={{-112,-10},{-92,10}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_b port_b
    annotation (Placement(transformation(extent={{92,-10},{112,10}})));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor layer1(G=G_wall1)
    annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor wallHeatCapacity(C=C_wall)
    annotation (Placement(transformation(extent={{-10,12},{10,32}})));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor layer2(G=G_wall2)
    annotation (Placement(transformation(extent={{60,-10},{80,10}})));
equation
  connect(layer1.port_a, port_a)
    annotation (Line(points={{-80,0},{-102,0}}, color={191,0,0}));
  connect(layer1.port_b, layer2.port_a)
    annotation (Line(points={{-60,0},{60,0}}, color={191,0,0}));
  connect(wallHeatCapacity.port, layer2.port_a)
    annotation (Line(points={{0,12},{0,0},{60,0}}, color={191,0,0}));
  connect(layer2.port_b, port_b)
    annotation (Line(points={{80,0},{102,0}}, color={191,0,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-120,
            -100},{120,100}}), graphics={
        Rectangle(
          extent={{-92,90},{92,-92}},
          lineColor={135,135,135},
          lineThickness=0.5),
        Line(
          points={{-60,90},{-60,-92}},
          color={135,135,135},
          thickness=0.5),
        Line(
          points={{60,90},{60,-92}},
          color={135,135,135},
          thickness=0.5),
        Rectangle(
          extent={{-92,90},{-60,-92}},
          lineColor={135,135,135},
          lineThickness=0.5,
          fillColor={135,135,135},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{60,90},{92,-92}},
          lineColor={135,135,135},
          lineThickness=0.5,
          fillColor={135,135,135},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-60,90},{60,-92}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={175,175,175},
          fillPattern=FillPattern.Solid),
        Line(
          points={{-92,60},{-60,90}},
          color={0,0,0},
          thickness=0.5),
        Line(
          points={{-92,40},{-40,90}},
          color={0,0,0},
          thickness=0.5),
        Line(
          points={{-92,20},{-20,90}},
          color={0,0,0},
          thickness=0.5),
        Line(
          points={{-92,0},{0,90}},
          color={0,0,0},
          thickness=0.5),
        Line(
          points={{-92,-20},{20,90},{40,90},{-92,-40}},
          color={0,0,0},
          thickness=0.5),
        Line(
          points={{-92,-60},{60,90}},
          color={0,0,0},
          thickness=0.5),
        Line(
          points={{-92,-80},{80,90}},
          color={0,0,0},
          thickness=0.5),
        Line(
          points={{-80,-92},{92,80}},
          color={0,0,0},
          thickness=0.5),
        Line(
          points={{-60,-92},{92,60}},
          color={0,0,0},
          thickness=0.5),
        Line(
          points={{-40,-92},{92,40}},
          color={0,0,0},
          thickness=0.5),
        Line(
          points={{-20,-92},{92,20}},
          color={0,0,0},
          thickness=0.5),
        Line(
          points={{0,-92},{92,0}},
          color={0,0,0},
          thickness=0.5),
        Line(
          points={{20,-92},{92,-20}},
          color={0,0,0},
          thickness=0.5),
        Line(
          points={{40,-92},{92,-40}},
          color={0,0,0},
          thickness=0.5),
        Line(
          points={{60,-92},{92,-60}},
          color={0,0,0},
          thickness=0.5),
        Line(
          points={{80,-92},{92,-80}},
          color={0,0,0},
          thickness=0.5),
        Text(
          extent={{-44,122},{50,92}},
          lineColor={238,46,47},
          lineThickness=0.5,
          fillColor={175,175,175},
          fillPattern=FillPattern.Solid,
          textString="%name")}),                                 Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-120,-100},{120,
            100}})));
end LayeredWall;
