# manual coloring
# select t_diagram.Name as DiagramName, 'DiagramObject Color' as ColorType, Count(*) as NumberViolation
# from (t_diagramobjects
# inner join t_object on (t_diagramobjects.Object_ID = t_object.Object_ID))
# inner join t_diagram on (t_diagramobjects.Diagram_ID = t_diagram.Diagram_ID)
# where t_diagramobjects.ObjectStyle NOT like '%BCol=-1%' and t_diagramobjects.ObjectStyle  like '%BCol=%'
# Group by t_diagram.Name, ColorType
# Order by NumberViolation DESC

# coloring with legends
# Select DISTINCT  element.Stereotype, element.Name, element.Object_Type, "Potentially colored elements with Legend color" as ColorType, t_diagram.Name as DiagramName, t_diagram.Diagram_ID as DiagramID
# from (((t_object 
# inner join t_diagramobjects on (t_object.Object_ID = t_diagramobjects.Object_ID))
# inner join t_diagramobjects as dobjects on (dobjects.Diagram_ID = t_diagramobjects.Diagram_ID))
# inner join t_object as element on (dobjects.Object_ID = element.Object_ID) )
# inner join t_diagram on (t_diagram.Diagram_ID = dobjects.Diagram_ID)
# where t_object.NType = 76
# and element.NType <> 76
# and t_object.StyleEx like "%LegendOpts=57;%" 

Install-Module -Name PSSQLite
$db = "ArchiMateModel.qeax"
$sql =""
$sql +="select t_diagram.Name as DiagramName, 'DiagramObject Color' as ColorType, Count(*) as NumberViolation"
$sql +=" from (t_diagramobjects"
$sql +=" inner join t_object on (t_diagramobjects.Object_ID = t_object.Object_ID))"
$sql +=" inner join t_diagram on (t_diagramobjects.Diagram_ID = t_diagram.Diagram_ID)"
$sql +=" where t_diagramobjects.ObjectStyle NOT like '%BCol=-1%' and t_diagramobjects.ObjectStyle  like '%BCol=%'"
$sql +=" Group by t_diagram.Name, ColorType"
$sql +=" Order by NumberViolation DESC"
$result = Invoke-SqliteQuery -DataSource $db -Query $sql
if ($result) {
    Write-Output "DiagramObject Color violations"  
    Write-Output $result 
    Exit 1
} else{ 
    Write-Output "No DiagramObject Color violations"
}