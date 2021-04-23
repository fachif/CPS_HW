within CourseExamples.Workshop18.Linearization;
model HSN
  extends HeatingSystem;
  extends HeatingSystem_Interface;
equation
  connect(add.y, burner.Q_flow) annotation (Line(points={{-99,70},{-54,70},{-54,
          60},{-2,60},{-2,40},{16,40}}, color={0,0,127}));
  connect(add1.y, valve.opening) annotation (Line(points={{-99,-70},{-84,-70},{
          -84,-88},{72,-88},{72,-50},{50,-50},{50,-62}}, color={0,0,127}));
  connect(sensor_T_forward.T, T_forward) annotation (Line(points={{67,40},{84,
          40},{84,70},{110,70}}, color={0,0,127}));
  connect(sensor_T_return.T, T_return) annotation (Line(points={{-37,-50},{-44,
          -50},{-44,-94},{90,-94},{90,-70},{110,-70}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end HSN;
