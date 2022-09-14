<?xml version="1.0" encoding="UTF-8"?>
<Form xmlVersion="20211223" releaseVersion="10.0.0">
<TableDataMap>
<TableData name="ds1" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="department_id"/>
<O>
<![CDATA[]]></O>
</Parameter>
<Parameter>
<Attributes name="site_id"/>
<O>
<![CDATA[]]></O>
</Parameter>
<Parameter>
<Attributes name="part_number"/>
<O>
<![CDATA[]]></O>
</Parameter>
<Parameter>
<Attributes name="id"/>
<O>
<![CDATA[]]></O>
</Parameter>
</Parameters>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[cms_dev]]></DatabaseName>
</Connection>
<Query>
<![CDATA[SELECT        dbo.items.id, dbo.sites.name AS site, dbo.departments.name AS department, dbo.items.part_number, dbo.items.chinese_name, dbo.items.description, dbo.categories.name AS category, dbo.item_types.name AS type, 
                         dbo.units.name AS units, dbo.vendors.name AS vendor, dbo.items.allocation, dbo.item_locations.name AS location, dbo.items.min, dbo.items.max, dbo.items.lead_time, dbo.items.image, dbo.items.created_at, 
                         ISNULL(transactions.total, 0) AS total, (CASE WHEN dbo.items.min <= transactions.total THEN 'Good' ELSE 'Critical' END) AS status
FROM            dbo.items LEFT OUTER JOIN
                         dbo.sites ON dbo.items.site_id = dbo.sites.id LEFT OUTER JOIN
                         dbo.departments ON dbo.items.department_id = dbo.departments.id LEFT OUTER JOIN
                         dbo.categories ON dbo.items.category_id = dbo.categories.id LEFT OUTER JOIN
                         dbo.item_locations ON dbo.items.item_location_id = dbo.item_locations.id LEFT OUTER JOIN
                         dbo.item_types ON dbo.items.item_type_id = dbo.item_types.id LEFT OUTER JOIN
                         dbo.units ON dbo.items.unit_id = dbo.units.id LEFT OUTER JOIN
                         dbo.vendors ON dbo.items.vendor_id = dbo.vendors.id LEFT OUTER JOIN
                             (SELECT        item_id, SUM(quantity) AS total
                               FROM            dbo.transactions AS transactions_1
                               GROUP BY item_id) AS transactions ON dbo.items.id = transactions.item_id

where (dbo.items.site_id = '${site_id}'
and dbo.items.department_id = '${department_id}'
and dbo.items.part_number = '${part_number}')
or dbo.items.id = '${id}'
]]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
<TableData name="transaction_types" class="com.fr.data.impl.DBTableData">
<Parameters/>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[cms_dev]]></DatabaseName>
</Connection>
<Query>
<![CDATA[SELECT * FROM [dbo]A.[transaction_types]A]]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
<TableData name="part_number_dd" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="department_id"/>
<O>
<![CDATA[]]></O>
</Parameter>
<Parameter>
<Attributes name="site_id"/>
<O>
<![CDATA[]]></O>
</Parameter>
</Parameters>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[cms_dev]]></DatabaseName>
</Connection>
<Query>
<![CDATA[SELECT * FROM [dbo]A.[items]A
where site_id = '${site_id}'
and department_id = '${department_id}']]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
<TableData name="ds4" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="department_id"/>
<O>
<![CDATA[]]></O>
</Parameter>
<Parameter>
<Attributes name="site_id"/>
<O>
<![CDATA[]]></O>
</Parameter>
<Parameter>
<Attributes name="part_number"/>
<O>
<![CDATA[]]></O>
</Parameter>
</Parameters>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[cms_dev]]></DatabaseName>
</Connection>
<Query>
<![CDATA[SELECT id FROM dbo.items
where site_id = '${site_id}'
and department_id = '${department_id}'
and part_number = '${part_number}']]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
</TableDataMap>
<ReportFitAttr fitStateInPC="0" fitFont="false"/>
<FormMobileAttr>
<FormMobileAttr refresh="false" isUseHTML="false" isMobileOnly="true" isAdaptivePropertyAutoMatch="true" appearRefresh="false" promptWhenLeaveWithoutSubmit="false" allowDoubleClickOrZoom="false"/>
</FormMobileAttr>
<Parameters/>
<Layout class="com.fr.form.ui.container.WBorderLayout">
<WidgetName name="form"/>
<WidgetAttr aspectRatioLocked="false" aspectRatioBackup="-1.0" description="">
<MobileBookMark useBookMark="false" bookMarkName="form" frozen="false"/>
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[New Title]]></O>
<FRFont name="Arial" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LCAttr vgap="0" hgap="0" compInterval="0"/>
<ShowBookmarks showBookmarks="false"/>
<NorthAttr size="59"/>
<North class="com.fr.form.ui.container.WParameterLayout">
<WidgetName name="para"/>
<WidgetAttr aspectRatioLocked="false" aspectRatioBackup="-1.0" description="">
<MobileBookMark useBookMark="false" bookMarkName="" frozen="false"/>
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[New Title]]></O>
<FRFont name="Arial" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<Background name="ColorBackground"/>
<LCAttr vgap="0" hgap="0" compInterval="0"/>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.TextEditor">
<WidgetName name="id"/>
<WidgetID widgetID="9872a9b6-f7ca-4a6b-a60f-a4a6f89d5520"/>
<WidgetAttr invisible="true" aspectRatioLocked="false" aspectRatioBackup="-1.0" description="">
<MobileBookMark useBookMark="false" bookMarkName="" frozen="false"/>
<PrivilegeControl/>
</WidgetAttr>
<TextAttr/>
<Reg class="com.fr.form.ui.reg.NoneReg"/>
<widgetValue>
<O>
<![CDATA[]]></O>
</widgetValue>
<MobileScanCodeAttr scanCode="true" textInputMode="0"/>
</InnerWidget>
<BoundsAttr x="9" y="29" width="80" height="21"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.ComboBox">
<WidgetName name="part_number"/>
<WidgetAttr aspectRatioLocked="false" aspectRatioBackup="-1.0" description="">
<MobileBookMark useBookMark="false" bookMarkName="" frozen="false"/>
<PrivilegeControl/>
</WidgetAttr>
<DirectEdit>
<![CDATA[false]]></DirectEdit>
<watermark>
<![CDATA[Part Number]]></watermark>
<Dictionary class="com.fr.data.impl.TableDataDictionary">
<FormulaDictAttr kiName="part_number" viName="part_number"/>
<TableDataDictAttr>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[part_number_dd]]></Name>
</TableData>
</TableDataDictAttr>
</Dictionary>
<widgetValue>
<O>
<![CDATA[]]></O>
</widgetValue>
</InnerWidget>
<BoundsAttr x="249" y="8" width="80" height="21"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.ComboBox">
<WidgetName name="department_id"/>
<WidgetAttr aspectRatioLocked="false" aspectRatioBackup="-1.0" description="">
<MobileBookMark useBookMark="false" bookMarkName="" frozen="false"/>
<PrivilegeControl/>
</WidgetAttr>
<DirectEdit>
<![CDATA[false]]></DirectEdit>
<watermark>
<![CDATA[Department]]></watermark>
<CustomData>
<![CDATA[false]]></CustomData>
<Dictionary class="com.fr.data.impl.DatabaseDictionary">
<FormulaDictAttr kiName="id" viName="name"/>
<DBDictAttr tableName="departments" schemaName="" ki="-1" vi="-1" kiName="id" viName="name"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[cms_dev]]></DatabaseName>
</Connection>
</Dictionary>
<widgetValue>
<O>
<![CDATA[]]></O>
</widgetValue>
</InnerWidget>
<BoundsAttr x="169" y="8" width="80" height="21"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.ComboBox">
<WidgetName name="site_id"/>
<WidgetAttr aspectRatioLocked="false" aspectRatioBackup="-1.0" description="">
<MobileBookMark useBookMark="false" bookMarkName="" frozen="false"/>
<PrivilegeControl/>
</WidgetAttr>
<DirectEdit>
<![CDATA[false]]></DirectEdit>
<watermark>
<![CDATA[Site]]></watermark>
<CustomData>
<![CDATA[false]]></CustomData>
<Dictionary class="com.fr.data.impl.DatabaseDictionary">
<FormulaDictAttr kiName="id" viName="name"/>
<DBDictAttr tableName="sites" schemaName="" ki="-1" vi="-1" kiName="id" viName="name"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[cms_dev]]></DatabaseName>
</Connection>
</Dictionary>
<widgetValue>
<O>
<![CDATA[]]></O>
</widgetValue>
</InnerWidget>
<BoundsAttr x="89" y="8" width="80" height="21"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.parameter.FormSubmitButton">
<Listener event="click" name="Click1">
<JavaScript class="com.fr.js.JavaScriptImpl">
<Parameters/>
<Content>
<![CDATA[this.options.form.getWidgetByName("id").setValue("");]]></Content>
</JavaScript>
</Listener>
<WidgetName name="Search"/>
<WidgetAttr aspectRatioLocked="false" aspectRatioBackup="-1.0" description="">
<MobileBookMark useBookMark="false" bookMarkName="" frozen="false"/>
<PrivilegeControl/>
</WidgetAttr>
<Text>
<![CDATA[Proceed]]></Text>
<Hotkeys>
<![CDATA[enter]]></Hotkeys>
</InnerWidget>
<BoundsAttr x="329" y="8" width="80" height="21"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.TextEditor">
<Listener event="stopedit" name="Edit End1">
<JavaScript class="com.fr.js.JavaScriptImpl">
<Parameters/>
<Content>
<![CDATA[// Get Value from widget
var code = this.getValue();

// Clear value of widget
this.setValue('');

this.options.form.getWidgetByName("id").setValue(code);
_g().parameterCommit();]]></Content>
</JavaScript>
</Listener>
<Listener event="beforeedit" name="Before Editing1">
<JavaScript class="com.fr.js.JavaScriptImpl">
<Parameters/>
<Content>
<![CDATA[this.options.form.getWidgetByName("site_id").reset();
this.options.form.getWidgetByName("department_id").reset();
this.options.form.getWidgetByName("part_number").reset();]]></Content>
</JavaScript>
</Listener>
<WidgetName name="qrcode"/>
<WidgetID widgetID="aeb8bee9-1cd8-4ef4-9b69-32a4117e8162"/>
<WidgetAttr aspectRatioLocked="false" aspectRatioBackup="-1.0" description="">
<MobileBookMark useBookMark="false" bookMarkName="" frozen="false"/>
<PrivilegeControl/>
</WidgetAttr>
<TextAttr/>
<Reg class="com.fr.form.ui.reg.NoneReg"/>
<watermark>
<![CDATA[Tap to scan QR Code Here]]></watermark>
<widgetValue>
<O>
<![CDATA[]]></O>
</widgetValue>
<MobileScanCodeAttr scanCode="true" textInputMode="2"/>
</InnerWidget>
<BoundsAttr x="9" y="8" width="80" height="21"/>
</Widget>
<ShowBookmarks showBookmarks="false"/>
<Sorted sorted="true"/>
<MobileWidgetList>
<Widget widgetName="qrcode"/>
<Widget widgetName="site_id"/>
<Widget widgetName="department_id"/>
<Widget widgetName="part_number"/>
<Widget widgetName="Search"/>
<Widget widgetName="id"/>
</MobileWidgetList>
<FrozenWidgets/>
<MobileBookMarkStyle class="com.fr.form.ui.mobile.impl.DefaultMobileBookMarkStyle"/>
<Display display="true"/>
<DelayDisplayContent delay="true"/>
<UseParamsTemplate use="false"/>
<Position position="1"/>
<Design_Width design_width="360"/>
<NameTagModified>
<TagModified tag="site_id" modified="true"/>
</NameTagModified>
<WidgetNameTagMap>
<NameTag name="site_id" tag="SELECT FROM LIST"/>
</WidgetNameTagMap>
<ParamAttr class="com.fr.report.mobile.DefaultMobileParamStyle"/>
<ParamStyle class="com.fr.form.ui.mobile.impl.DefaultMobileParameterStyle"/>
</North>
<Center class="com.fr.form.ui.container.WFitLayout">
<Listener event="afterinit" name="After Initialization1">
<JavaScript class="com.fr.js.JavaScriptImpl">
<Parameters/>
<Content>
<![CDATA[var item = this.options.form.getWidgetByName("item_id").getValue();

var btns = [
	this.options.form.getWidgetByName("receiving"),
	this.options.form.getWidgetByName("issuance"),
	this.options.form.getWidgetByName("borrow"),
	this.options.form.getWidgetByName("return")
]A;

if(item == '' || item == null){
	for (var btn of btns) {
	    btn.setVisible(false);
	}
}]]></Content>
</JavaScript>
</Listener>
<WidgetName name="body"/>
<WidgetAttr aspectRatioLocked="false" aspectRatioBackup="-1.0" description="">
<MobileBookMark useBookMark="false" bookMarkName="" frozen="false"/>
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="10" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[New Title]]></O>
<FRFont name="Arial" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<appFormBodyPadding class="com.fr.base.iofile.attr.FormBodyPaddingAttrMark">
<appFormBodyPadding interval="1">
<Margin top="4" left="4" bottom="4" right="4"/>
</appFormBodyPadding>
</appFormBodyPadding>
<LCAttr vgap="0" hgap="0" compInterval="0"/>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.FreeButton">
<Listener event="click" name="Click1">
<JavaScript class="com.fr.js.JavaScriptImpl">
<Parameters>
<Parameter>
<Attributes name="item_id"/>
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=$item_id]]></Attributes>
</O>
</Parameter>
<Parameter>
<Attributes name="transaction_type"/>
<O t="I">
<![CDATA[4]]></O>
</Parameter>
</Parameters>
<Content>
<![CDATA[FR.mobilePopup({
	target: "template",
	parameters: {
		'item_id':item_id,
		'transaction_type':transaction_type
		},
	setting: {
		templatePath: "/transactions/transact.frm",     
		border: {
			type: 0,
			color: "rgb(0,0,0)",
			borderRadius: 4.0
		},
		background: {
			color: "rgb(255,255,255)"
		},
		mobileRegular: {
			type: "custom" || "auto_height",
			heightPercent: 95.0,
			widthPercent: 95.0
		},
		padRegular: {
			type: "custom" || "auto_height",
			heightPercent: 95.0,
			widthPercent: 95.0
		}
	}
});]]></Content>
</JavaScript>
</Listener>
<WidgetName name="return"/>
<WidgetID widgetID="7f085e33-abf1-4a9d-a8ea-798c6a41aed7"/>
<WidgetAttr aspectRatioLocked="false" aspectRatioBackup="-1.0" description="">
<MobileBookMark useBookMark="false" bookMarkName="button0" frozen="false"/>
<PrivilegeControl/>
</WidgetAttr>
<Text>
<![CDATA[RETURN]]></Text>
<Hotkeys>
<![CDATA[]]></Hotkeys>
</InnerWidget>
<BoundsAttr x="270" y="285" width="90" height="241"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.FreeButton">
<Listener event="click" name="Click1">
<JavaScript class="com.fr.js.JavaScriptImpl">
<Parameters>
<Parameter>
<Attributes name="item_id"/>
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=$item_id]]></Attributes>
</O>
</Parameter>
<Parameter>
<Attributes name="transaction_type"/>
<O t="I">
<![CDATA[3]]></O>
</Parameter>
</Parameters>
<Content>
<![CDATA[FR.mobilePopup({
	target: "template",
	parameters: {
		'item_id':item_id,
		'transaction_type':transaction_type
		},
	setting: {
		templatePath: "/transactions/transact.frm",     
		border: {
			type: 0,
			color: "rgb(0,0,0)",
			borderRadius: 4.0
		},
		background: {
			color: "rgb(255,255,255)"
		},
		mobileRegular: {
			type: "custom" || "auto_height",
			heightPercent: 95.0,
			widthPercent: 95.0
		},
		padRegular: {
			type: "custom" || "auto_height",
			heightPercent: 95.0,
			widthPercent: 95.0
		}
	}
});]]></Content>
</JavaScript>
</Listener>
<WidgetName name="borrow"/>
<WidgetID widgetID="7f085e33-abf1-4a9d-a8ea-798c6a41aed7"/>
<WidgetAttr aspectRatioLocked="false" aspectRatioBackup="-1.0" description="">
<MobileBookMark useBookMark="false" bookMarkName="button0" frozen="false"/>
<PrivilegeControl/>
</WidgetAttr>
<Text>
<![CDATA[BORROW]]></Text>
<Hotkeys>
<![CDATA[]]></Hotkeys>
</InnerWidget>
<BoundsAttr x="180" y="285" width="90" height="241"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.FreeButton">
<Listener event="afterinit" name="After Initialization1">
<JavaScript class="com.fr.js.JavaScriptImpl">
<Parameters/>
<Content>
<![CDATA[var item = this.options.form.getWidgetByName("item_id").getValue()
if(item == '' || item == null){
	this.setVisible(false);
}
]]></Content>
</JavaScript>
</Listener>
<Listener event="click" name="Click1">
<JavaScript class="com.fr.js.JavaScriptImpl">
<Parameters/>
<Content>
<![CDATA[_g().parameterCommit();]]></Content>
</JavaScript>
</Listener>
<WidgetName name="button2"/>
<WidgetID widgetID="c3803363-15a7-452b-bfda-d6d3faed2a37"/>
<WidgetAttr aspectRatioLocked="false" aspectRatioBackup="-1.0" description="">
<MobileBookMark useBookMark="false" bookMarkName="" frozen="false"/>
<PrivilegeControl/>
</WidgetAttr>
<Text>
<![CDATA[Refresh Page]]></Text>
<Hotkeys>
<![CDATA[]]></Hotkeys>
</InnerWidget>
<BoundsAttr x="0" y="0" width="360" height="23"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.container.WTitleLayout">
<WidgetName name="report3"/>
<WidgetAttr aspectRatioLocked="false" aspectRatioBackup="-1.0" description="">
<MobileBookMark useBookMark="false" bookMarkName="report3" frozen="false"/>
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[New Title]]></O>
<FRFont name="Arial" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LCAttr vgap="0" hgap="0" compInterval="0"/>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.ElementCaseEditor">
<WidgetName name="report3"/>
<WidgetID widgetID="3e623f1a-845a-4451-904f-ea950e4b9f8e"/>
<WidgetAttr aspectRatioLocked="false" aspectRatioBackup="-1.0" description="">
<MobileBookMark useBookMark="false" bookMarkName="" frozen="false"/>
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[New Title]]></O>
<FRFont name="Arial" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<FormElementCase>
<ReportPageAttr>
<HR/>
<FR/>
<HC/>
<FC/>
</ReportPageAttr>
<ColumnPrivilegeControl/>
<RowPrivilegeControl/>
<RowHeight defaultValue="723900">
<![CDATA[762000,723900,723900,723900,723900,723900,723900,723900,723900,723900,723900,571500,723900,571500,685800,0,0,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[3962400,3962400,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200]]></ColumnWidth>
<CellElementList>
<C c="0" r="0" cs="2" rs="8" s="0">
<O t="DSColumn">
<Attributes dsName="ds1" columnName="image"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1" showAsImage="true"/>
<CellPageAttr/>
<Present class="com.fr.base.present.FormulaPresent">
<Content>
<![CDATA[=if($$$ = "" || $$$ = NULL, "ITEM DOES NOT EXISTS IN THE DATABASE.\n\nPLEASE CHECK IF THE QR CODE IS CORRECT", $$$)]]></Content>
</Present>
<Expand dir="0"/>
</C>
<C c="0" r="8">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="1" r="8">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="0" r="9" cs="2" s="1">
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=if(A11 = "" || A11 = NULL, "", CONCATENATE(A16, " ", B16))]]></Attributes>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Present class="com.fr.base.present.DictPresent">
<Dictionary class="com.fr.data.impl.DatabaseDictionary">
<FormulaDictAttr ki="1" vi="-1"/>
<DBDictAttr tableName="" schemaName="" ki="1" vi="-1" kiName="" viName=""/>
<Connection class="com.fr.data.impl.JDBCDatabaseConnection">
<DatabaseAttr creator="designer"/>
<JDBCDatabaseAttr url="" driver="sun.jdbc.odbc.JdbcOdbcDriver" auth="com.fr.data.auth.normal.NormalAuthentication" user="" password="___" encryptPassword="true">
<DBCPAttr/>
</JDBCDatabaseAttr>
</Connection>
</Dictionary>
</Present>
<Expand dir="0"/>
</C>
<C c="0" r="10" cs="2" s="2">
<O t="DSColumn">
<Attributes dsName="ds1" columnName="part_number"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand dir="0"/>
</C>
<C c="0" r="12" cs="2" s="3">
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=if(A11 = "" || A11 = NULL, "", if(A17 = "" || A17 = NULL || A17 = "0", "No Stocks", CONCATENATE(A17, " ", LOWER(B17))))]]></Attributes>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[Conditional Formatting1]]></Name>
<Condition class="com.fr.data.condition.ObjectCondition">
<Compare op="0">
<O>
<![CDATA[No Stocks]]></O>
</Compare>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ForegroundHighlightAction">
<Foreground color="-65536"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="0" r="14" cs="2" s="4">
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=if(A11 = "" || A11 = NULL, "", "View Transactions")]]></Attributes>
</O>
<PrivilegeControl/>
<NameJavaScriptGroup>
<NameJavaScript name="Transactions">
<JavaScript class="com.fr.js.ReportletHyperlink">
<JavaScript class="com.fr.js.ReportletHyperlink">
<Parameters>
<Parameter>
<Attributes name="item_id"/>
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=$item_id]]></Attributes>
</O>
</Parameter>
<Parameter>
<Attributes name="op"/>
<O>
<![CDATA[view]]></O>
</Parameter>
</Parameters>
<TargetFrame>
<![CDATA[_blank]]></TargetFrame>
<Features width="600" height="400"/>
<ReportletName showPI="true">
<![CDATA[/item_status_web/item_transactions.cpt]]></ReportletName>
<Attr>
<DialogAttr class="com.fr.js.ReportletHyperlinkDialogAttr">
<O>
<![CDATA[]]></O>
<Location center="true"/>
</DialogAttr>
</Attr>
</JavaScript>
</JavaScript>
</NameJavaScript>
</NameJavaScriptGroup>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="0" r="15">
<O t="DSColumn">
<Attributes dsName="ds1" columnName="site"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand dir="0"/>
</C>
<C c="1" r="15">
<O t="DSColumn">
<Attributes dsName="ds1" columnName="department"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand dir="0"/>
</C>
<C c="0" r="16">
<O t="DSColumn">
<Attributes dsName="ds1" columnName="total"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand dir="0"/>
</C>
<C c="1" r="16">
<O t="DSColumn">
<Attributes dsName="ds1" columnName="units"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand dir="0"/>
</C>
</CellElementList>
<ReportAttrSet>
<ReportSettings headerHeight="0" footerHeight="0">
<PaperSetting>
<PaperSize width="24688800" height="43891200"/>
</PaperSetting>
<Background name="ColorBackground" color="-1"/>
</ReportSettings>
</ReportAttrSet>
</FormElementCase>
<StyleList>
<Style horizontal_alignment="0" imageLayout="4">
<FRFont name="Arial" style="0" size="72"/>
<Background name="NullBackground"/>
<Border/>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="Arial" style="0" size="72"/>
<Background name="NullBackground"/>
<Border/>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="Arial" style="1" size="80"/>
<Background name="NullBackground"/>
<Border/>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="Arial" style="1" size="128"/>
<Background name="NullBackground"/>
<Border/>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="Arial" style="0" size="72" foreground="-16776961" underline="1"/>
<Background name="NullBackground"/>
<Border/>
</Style>
</StyleList>
<heightRestrict heightrestrict="false"/>
<heightPercent heightpercent="0.75"/>
<IM>
<![CDATA[m?r6)deUJp]Ai1htl'TpZAS(!DRrV8m[]A(E&9oISEe=(F$L!%V3Oi.YEQHH(neAt=_7%)24*#
DLN6kS,eQ%Tnf'nfhRPV#]Asp'Zb!n%&2lHXCuBq&eM_o6\3dn*dkNchm>'l[dtZl`X?;AS#F
a]Al3B-T<53o!jJu!(UIe+W<`&NICYWnk-BEIIls6]A'b-hm`h\mlaqhF>*(TGN=o1.eZ@1Vs+
$:+m$*J^QomDg9(GG^R;<s+1\O?U]A$;PL'41D%7^>`;>:MCR,enu3keA(nK;*`pQn3<(6b&b
nX^jl8))1'Zhp=1%/[q#nT,IgW:DcW!fWMMekM=udd2i.rM'fN*L<T:tbEDn1.o5I0i@-c2P
3U2H8DH8\64-lIE:`Ho@bbH)'LNeapA3[L+r/8\f?FU>]A#e+:;GL/!:XYR'pJ>a/Kj$+*q^V
8@oV:h&:!sI[ImCT2DqsLM4>>rjl^A53M^7K<K/dLGg]A4cO;E+H\^\JMQHlsfrpPkg=-D#sA
I9Iu]A^Ia_Qb>j).@:'/`,o[0GgV=-Aq3Hh>KBYERnYhN`4/N(fsV)eZ_YAd=$:@]Ae=7u%l\m
%u>!6m%O8.;(jBq\r&S!#Hu+1Q^BI_n9Eg7q.MiQY*H4p=E+"::RdI,Vne(*`g07;W;]AX/n(
#D!L2e0)@bFYRKV`YE[DEkPJ0gHR-.E1$pB)hoPm^4+#%j0NBg6KpHRScFLYhmrZ>):na6bL
/Nb'_Nd?$DKhBVq?Fc)5&J?d&lO60:/0;XA3,bK44R'<a1fm0sJkODI\W<D/fV[]At*pa2aD-
--3O3QVCJr;e2Zkarm%k[u4,]AO`5+WV6;E-;GL6V(VAO!L7FT4M$C3&4VCcftlAF]AJGsHlK,
XB9!"hD1+(+<F"ok[=!LH[q5>nc=QASK6*I0.Slr9,ViH;%pcl'eT4bL`m]Ai4"E_5!oAarfe
E9,e'CM3$GqB+/ePK4cAlq<:%n2"9)*fG=7"Ut_$kHURB-G[=qqS)c2&);11B?GY650tQH.u
NT-p<eJ9\u@$q+81a5YMse<!E8[5%K#\hn3-&^LA4$_gE;=/7qm4Q.RVl)`(HV!EFaKr3k&a
]AWP`FN8r0D'HEZi!nWH(30tMY:.LKFC8,]Aa)@q%:+:JSR6k3gk::/o1f[8JVcE8:IY./Ef)d
*N2fDO-t1Inpf+X<`=VLHTc^+?hHU)Bpp[2ni'MR?1"]Akq82QGDYs$5R1uaC2:UlQB>-dX+#
I4k5fk98moK3CXm4.%hAne:sZr.@dd,r`9TmiEI")2ZVs-`)#VFs4m)Ggqhje*,#]AALIcZmp
@0eom?">jORY5$_*eD%/r!Gh&b[Jfa\iXk'Qs>7$HgWUcNf_A,E.LjTSeqJgl`rkAq7g40nM
/>f%I89@cBUJ>t:T`DAB3:B%n/OoJ"4RIIS*b4a&=T\"P*beg6JXX'ad8Lj3/V6E:M4V0f%a
O.LJdOM1LqD_\>\5nT>n/NHMseU;mXoEIlF<_n*jOmVAW^O=1"?WX)!0Z"!S8'ZVM++%+,08
)nVl<h/X]AB51.R,5M$djZGk:_..gbN3W47,jfi+;\R%o@2VJ$ucS.J?acA^#8jNg5SQ_I16l
CbnS\Y'#U`0Ucfr@S`iqFCI)+_3h/8]ApCiZ!.Y*&-Z\2=H^J,!YUgmCuPEN*"FS+)+a^"7fP
b/f!+.H58^)uBifE-(tPt_^A]ABUKm6ccS1IS/KEh9lPqf'2C&J#9&OEMFMk$#,UbT^g7<>6T
FBJ\Q:t-.1RTM<DkV$5kr.4HE\d0Gbqr3rbgq2SWr&1,jN,hd9*;9jI""gH&-Imr_B.U66m)
G1q"^2X[2SIF=HDH`^YW`1>]AKB*lB)$3)BD\49'O#Il4s2`(=<l%85J\)-cM5%QS7Bl!'a`i
\)u15!9FXL>a0fAD!2K=n&rlapKY*C"G2]AkDWZFO%WUclRJCZfm)6ekHDAD#<lkpEh7/#,3R
AB^.E(<$h(/-)b*Nj#U\kkqZA9XsB<]A"]A7EZe6H:up'YW6mSJNVgH?mi8p6=5f(#On:,<$uq
RnK/,A$)H.7[R*5!TX4=%::%i2!8n#]AkU(;i:ELIi$_a=d>*_l'SI<7/#(g=MP((3$>@]A<rf
=rNoWd?)BMbUHdl%m7*5FG<>.$*qn`3[#,s(]Al+^)B@Fmq7-7j=)#s8Y-d=&$>'6du3Jd`Zo
4p(#HqieVfN=erNAuXl%,u-u"i)eadD[mHj<*/<_MFUdB!,<!JJdkle\>hulQW[AR@SQ:!me
"6.SN(P9,-!guI?$XsKN8H+MgA;?d`Gm?I0cI:B7c1*.YS0uPf/h48gbR0elGj#F>'p9qVQJ
ZD8DYg9.78#EpGXIP)LtI?h@J6q6M,5PITJAJH9pB?sKL.XAX<;S?:+9e:i5<)`Q.3VR<VFp
k61mRhnaoksEX8-YO*Q#r#q>DfZ6lPm4`r0e$akE=*/Z*+/AH1TUC82R*AJNQsla5<E^#\tD
8'=OV6NnVn@"^+Gi:T1uT*9Jp@\9*u:=L#J-mB4HV_iE2=NJYQ]Atai:8k7U2?(6I:4)8t/>N
<XMOtUof3KL"ueG*b9)<PK;`E!P%mgi*`<feZY;!FU\U!6?n6.\GG`WX9?OC#HHlc@/L"p'a
#C_M^+Z"_;gB/Vr+DKD.gL$@eHruWTVJ6,j3d"DKDtI!+ADG:c3KF"a3bi]AkJf3%_^G:\#EW
!VJ$d5#./6H("XJC\:Y3\itF_:PBQ>*"N5t'L,kbiFf-*PHHPpr+Ce%JBk#fKH.Aepli7n`j
S/><dmu"d_mBeQB9VVKkG2?[Sn);=`cbpI,Ym%VI;+F`$]Aa"[MekpBT1lGL4orfV*%W:L]A_i
'KiX-#'r,$cQcG%'m/`;*#/1Lo)raId$?X@=.Cit?L2IoL?1>eI5=Y"3L9&TPbTI@3:(oqC.
qSd[6`l5f+/]ANbmA);1/r"nTrNo=">C((lSS03,en4iX5Z2',mVD^.P?,lJGpIn85GfJa.he
>]AL%8"mB,@>';pe<@<n2Nrh]A=uLCP)fif-N&MDTUh)OHs&GCI&^#Rhn=;u.2RLE$*Z3I8@i.
5dV;O*1NR9sF0X'G*gOI2?L!(^*q)N[WkZ6op-P81XI?li7uIf4"K`b,WVtsXcqIZt>Ct\[S
$W^ro@L`Z7.n9jJ0s)K\lXG1\::g1:PI9[UZ!H1ko3^^*+J+V#thUmX#>um*<oe\]AtQP=n_@
543U`u5<.D5A-0sc(Fh:jq?,7'`E-5lECmLeWgk[\EA^V>7GUC_nGZQ9Yk<.d@C_:t[\@T<4
P_sFmTu5IbO!!Q*%^0B]AAr-\HW([_nQEki6foN?'@a;Xp56M=k>!?Xdn<L[/+K&J/Oi6;]AN2
Fo\p&mm"js15HVDU;OUlW,iX:Z1f`VJ8qVuf]A.-=tBEIXZSS^rZ$)V@W.T#8T[i(5).,Qh4Z
Ea0eYR:3L@V9k``lkRS'(!LqDpJ54O"-;?2mNU@em``O8M+kf_ejWj/o.JMZMBWDb<1Id@A;
N9!iq7Uq5TJH?*mT*T_QM?K%S>I;?!]APVTn+]A5:RG99l)oiar.0_GHTN!tn+NO84_I*26FKJ
3g=-$1=bD'2F!3M&boL=sK<$;<4M:RS<j1[Zg/C'rDkO.6o=.":EWA9<l6_'uMX/54/31W=*
C>0F)0lVC*4cUC)q*=i'`h^:4$Hss^q7^u!7U5mm`EoNr/a)4c>,U?<Hl$:EH>4>>jZ4tU3i
*#A.s[dnFN&Xq;Fo$7=D_%`@8mH-Y3V,>s8789d1aHVo^P$;l0Z>9/OiS6GH\c^qN#9k>f(*
12&mX"8UMgP3NFu(Z4'$UC,[kE>&W>p1A)tcauU_7q\uE2DciZOT5(1l<2):#D'51sa;kdj3
G++_:u/0%3'BX7&>Zs(2;,e,[qPX(&ueum1"+s90lq\og=d`29-^Uh!(\!`#JtV1&',[1]A5"
5ZWLmUn-U0[!7`H,=5sP^B/.H5SaqQl/Q:1SZ8^8X`%=@eb,Cb0QfLYF!p7Hf.k:I9jAo/?g
O7@rMn(M!#%u'd.N+p']AZslR7gY_%mgs.5?.$bBnkbje*=*UfrF#k2AQ:$lGgo]A0C6e1Y:N(
hLEP\Fib:"gK#(r@ujRlp]AToR"91brZ",QE5mK8bZHlH\^8PWl*ee5aa(8r1tu#&qCj$%^#-
A5594]AY@I/*'`!to.E9&@`(QE!FT/<@hBW<>es*r/:g'71_(=O/pLQ>D_P&,[@7kV70Yj2lb
7(<joX/BiqKTl#$a_aU!C2@%J7jAE\gT^?Z4Y)JT`o`Q/F-$_`X.tCRTYJ-dK*F58d9oc(W&
;Pr,;@u;bJ8q@JQ2Sf3W=Wh9aa5m9k3J:*T&@>\m%>2W5NEqI!)oBm$fTVP(FYX:dl`K@:_8
&,c<aJFhc%[W5l"4+]AS42p:b7n1luV:":t_,-1N%m++_@3E7#%&a$=F.E4&aM,VNq<pJM>3d
ICA_27$5%d>+(PcfAFb=5jo@jj`4lib6S\2HU<;WRT]A;:_PVYU"obU]Ao*[o[<B*?WB&%7U.B
FKXBkW<EX`502(#XMNFM)LDdhRYJWcO,LAd7V?hCqjWE!l]A)0+Edg=%)ph'M+=FdK)hkE.iM
WVTVhQ_GN;cmW&mBNPuM/nReDi?Sn>gQ3;%+6=A_P07ugiMj&CLS7.%`0>6IaQ"=!T]AL?&=d
uCh<4m:AV?s4iT$Dp<NB&BadV\-eF]ANEQ.%L1fgEQGFEE.Mc.i,/=IMnu?6-.Kk[]Ae1Tb8oW
1p&.RQtX',\;aa&#Hp,X1'<V!l4XoG91G7<Wn.Ho0Hcujh)SO&$c[j*?[5GBDt&L6CD.&L%g
Op,0BBf0#(MB@OmL)_ZF51?^2d[`N8M-EQcMLnbqaJXI+KFZOmB$3J]A9On:P^n)/[GR#8/(,
V)csq$Kq'0_2#NTc[")sk\'\GB:s3Xd"Rk.G'6X=rg:4B]A6dl!/TXG=95!&7UaRNt(83XWLr
Em[gD[h"Eg369C"l%5dB<0-i!;:'!DpLF(:CiSY:KZb5Nq3*-o%Ve]AF*!]A>?OgD[>39lKgQE
=nGjT_FMm/[u/H55^/j$aS_1LC8H>ioj`^@PsO$*:rp8./&*E9m!Ta5YF)m9UfO:AIoK>6%V
15KrLVYEmp7>!(,"<>a`hToghWV2&B^pG-=A9;"S:]AO@+iVor$,*lAD':_6QjqgIgWD%IIEL
X??W-4u`,okSHn)V(-r5@5eL:Ui!R%kKrq_?'ba',Hp'*#sshZ0?/.V^kDk+?j.7!,^lG9o'
#WJa7W@WlW76E63ChXah,+m:\q!MbgW:_U;K"fp=s/jD3&0`F&A7"`'G"e*!a7Vf$m6Ib("6
,T^[99s/a&rd&J*UaoMn#cpd4\A4frt-1%e8.se+]AQ*@1N24bG_9J*=c/;=V(u/_.6OZ?``u
uF&trW$,Lq26EYPVHSd-1iR]A=[CU,$TFaa'Qq1r1Q"Lq_-[r8j&=TLnVMUIR,22#-YUlsT.F
CL*ih?Sg82$RH:>mPFL/prmX9M@GoS@E*NUe4'FclLVmYH:am93\,0:KOg0hJub@dXaaIP4h
tlb)MU=1rZ^PPBp*_8)imsK^1I/`?JA)QaHD]Au#/X8GS?upB##O'aq"604D#cNK:DQd<]ASCL
A'P3FYHJA]AOW,$3l:K<YE;266N#WF<8&mRpS^bQ-]A_daCq^bb`j"In96",HP^0"oHI%]A<=PD
WqkL!g[E-[+K6\#[dNHLE!&C]A&lGZ]A"p]AKhKYPtk7WlEr3-ZRpu)P[9cW]AhbT<q1_+or4C6<
o:R$ac<B2QqZU=%hXg/+VKdm;+ZSk$/=*_5d"IF*Z`K!.UEK\Y6;Laa$k,\j`qG&G]A+"%WO"
#"11P0!td4(eiZGs+Tp`Ck(pOeEDDRC?mtM//SJa:^AP.$J0&cm8gf-oD1YFK1AtKimq6JdM
5rHE#-)+YP6:>Y$MjUS_XF4dP><.4?`"E)Y'm+<:]AC3s$>!!^1Y$^-9Z8R=S@]AQD8ig6.bXN
(;tuc_Gn9%l&6@*-YHRkb4.2c;Mm\qrDp3b\(H0U]A3qpt[o9UMJ<dbKhcZF2W%q&YT=IE<+?
*HNLh`l0d(5RY1U`fL8?.`I#/ar(77&le>KCXRHSa?(bV2FS-C#B$Rl'H+X%#B(FomNENooS
Y2H6b%Oi4@_<hV3@J8aMrU)5X[*W6"!7jp)r[6%cFdoM2(?[Z[BE`oDE1ZVk%=GZj=dGJBa2
"sU.p,4D]ATY6.:bA@s@6.GB+=";>q]AeSa98T\GN`WLAVe\nQXpkU!6/_1tN]A9=+f\1jdO^2?
LGt>M19J^RsG&T;P;!Qp&3$-.nO;8"=nqo8B>EKa<cQ6Ei5%U+>RT&0+4(VlRUkQ_33`1"&k
T^<6Z6=,1&seVh_*`G"u>eERNd%-P8Gl$XM$UM=6GTjD8\D]Ae7g8LhuYc_MS.Q3]ASYkl[35I
5Wd!LL2L%q*V-.[e:IN\%%&jl,LT)_IAeBW@Z4IoVu_cbelF,4NZ;S+2;/C#1&+d8$KqFq$q
:X+RC;j##K>O'!O^+5U6_kWrmJF$9R:JPaEqOc'gS?J#`=oDhF-d3oPpcO+ed(q@XE;-12of
Isg1CG0([s"nYWkf/&<Y?n.0hl+iZE:[G3U'KN5UYRUj%grNfu!Qbb?N=Q<X"GKOImb=b-kO
rT)`-<!I*HkX8-0pg?8h=foUY]A#hTNGsA#E:/PIa^8s92ouF:[0\7)YV;?)L2`u_[(AN6rH6
[ClH#\!.of.c)(G<"9G[;dM#R(-77[/UN]A-\05u\R<2Gh#(Z>LSm?WoI,Q5=g="967XS?chY
#PFJVUofF,3Mdd6NrCWP2LKFdhM,.n-kE;_07<$q>,`).#6c3EcIXe:?&8C'o-'R;H"r]AbF>
qmhMmZLLG4fu%d9Ue:HQ?f0`FSO`P6aB)M8,AVY4WP\5JMT`p69=/3!J:4M"\9BI@mM.\^=A
FjVUjOp"jI.]AM5jT7G-)CQT.2gq[)c&"S/<m\j`W:8@$ZS)DKU=f()3V]Af'>%ZA$1GC4>@HT
e,2\gKE&3gnO\E#;aK*+J8c`#EJ9GR^.M"]A')rA9V4RFMdVCY'g<^OFs,XTR/7X9?CDG&)lf
FH<)di==rMZe&E-,<`.^'-`H31U\F&,@k!!hp&l^fi1<:tL(6?LFm2/`_1Td04R7nj>45F$K
qO"l>utfY7d8kK(3-k%L#?;adM>W;`q,S&\m?sWh?8A^#^g6"5MnguP;f.D&5Y6t]A7:n0XOC
$Q\&ZGX'[kc#qedP+F1ebt[:"(_',"O<WXY//QH4LDM>k?0VSK82T%=,JSZb0hCM<o5l@SmT
2NMl7'9tXi96GB6"F#FD`J%SsW&9f)&SWN.p`Pl1=_gr@=nC8tk+;$IGIpA0O%ZGW&VfajBZ
P)0Romldb<lkg(ba@,?jWh\dn_qLn4GJqBU`eq0gAgV-#P#:YUj[H/\O&=X-Ye)-)^1$3Q92
TXK9_"]A/6ZbpKpA'ndr-oeSe*Xjh93=R3I75c5FL1n90,'XM3FIB:^p*RHMe8juN%'H-SNbS
hpBWQp2LGEO>2Z^To`8fGbX1Y)=p"<_Ld-brjnT]Abu[/T!"]A*o4U'=ZrQ5%C%%f_dn8(=n^d
=o,3E.n>j#AT>j#AT>lWP`2f_ttm4O]ApVjUcdp&siehKebA^B+~
]]></IM>
<ElementCaseMobileAttrProvider horizontal="4" vertical="4" zoom="true" refresh="false" isUseHTML="false" isMobileCanvasSize="false" appearRefresh="false" allowFullScreen="false" allowDoubleClickOrZoom="true" functionalWhenUnactivated="false"/>
<MobileFormCollapsedStyle class="com.fr.form.ui.mobile.MobileFormCollapsedStyle">
<collapseButton showButton="true" color="-6710887" foldedHint="" unfoldedHint="" defaultState="0"/>
<collapsedWork value="false"/>
<lineAttr number="1"/>
</MobileFormCollapsedStyle>
</InnerWidget>
<BoundsAttr x="0" y="0" width="360" height="221"/>
</Widget>
<ShowBookmarks showBookmarks="false"/>
<body class="com.fr.form.ui.ElementCaseEditor">
<WidgetName name="report3"/>
<WidgetID widgetID="3e623f1a-845a-4451-904f-ea950e4b9f8e"/>
<WidgetAttr aspectRatioLocked="false" aspectRatioBackup="-1.0" description="">
<MobileBookMark useBookMark="false" bookMarkName="" frozen="false"/>
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[New Title]]></O>
<FRFont name="Arial" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<FormElementCase>
<ReportPageAttr>
<HR/>
<FR/>
<HC/>
<FC/>
</ReportPageAttr>
<ColumnPrivilegeControl/>
<RowPrivilegeControl/>
<RowHeight defaultValue="723900">
<![CDATA[723900,762000,723900,723900,723900,723900,723900,723900,723900,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[3962400,3962400,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200]]></ColumnWidth>
<CellElementList>
<C c="0" r="0" cs="2" s="0">
<O>
<![CDATA[View Item Details]]></O>
<PrivilegeControl/>
<NameJavaScriptGroup>
<NameJavaScript name="Web Report1">
<JavaScript class="com.fr.js.ReportletHyperlink">
<JavaScript class="com.fr.js.ReportletHyperlink">
<Parameters>
<Parameter>
<Attributes name="op"/>
<O>
<![CDATA[view]]></O>
</Parameter>
<Parameter>
<Attributes name="part_number"/>
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=$part_number]]></Attributes>
</O>
</Parameter>
</Parameters>
<TargetFrame>
<![CDATA[_dialog]]></TargetFrame>
<Features width="600" height="400"/>
<ReportletName>
<![CDATA[/items/items_view.cpt]]></ReportletName>
<Attr>
<DialogAttr class="com.fr.js.ReportletHyperlinkDialogAttr">
<O>
<![CDATA[Item Details]]></O>
<Location center="true"/>
</DialogAttr>
</Attr>
</JavaScript>
</JavaScript>
</NameJavaScript>
</NameJavaScriptGroup>
<Expand/>
</C>
<C c="0" r="1" cs="2" s="1">
<O t="DSColumn">
<Attributes dsName="ds1" columnName="part_number"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="2" showAsDefault="true"/>
<CellPageAttr/>
<Expand dir="0"/>
</C>
<C c="0" r="2" s="2">
<O>
<![CDATA[Stocks on Hand]]></O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="1" r="2" s="3">
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="3" s="2">
<O>
<![CDATA[Remarks]]></O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="1" r="3" s="3">
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="4" s="2">
<O>
<![CDATA[For Order]]></O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="1" r="4" s="3">
<PrivilegeControl/>
<Expand/>
</C>
</CellElementList>
<ReportAttrSet>
<ReportSettings headerHeight="0" footerHeight="0">
<PaperSetting>
<PaperSize width="24688800" height="43891200"/>
</PaperSetting>
<Background name="ColorBackground" color="-1"/>
</ReportSettings>
</ReportAttrSet>
</FormElementCase>
<StyleList>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="Arial" style="0" size="72" foreground="-16776961" underline="1"/>
<Background name="NullBackground"/>
<Border/>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="Arial" style="0" size="96"/>
<Background name="ColorBackground" color="-14701083"/>
<Border>
<Top style="1" color="-16777216"/>
<Bottom style="1" color="-16777216"/>
<Left style="1" color="-16777216"/>
<Right style="1" color="-16777216"/>
</Border>
</Style>
<Style imageLayout="1" paddingLeft="5">
<FRFont name="Arial" style="0" size="72"/>
<Background name="ColorBackground" color="-6697729"/>
<Border>
<Top style="1" color="-16777216"/>
<Bottom style="1" color="-16777216"/>
<Left style="1" color="-16777216"/>
<Right style="1" color="-16777216"/>
</Border>
</Style>
<Style imageLayout="1">
<FRFont name="Arial" style="0" size="72"/>
<Background name="NullBackground"/>
<Border>
<Top style="1"/>
<Bottom style="1"/>
<Left style="1"/>
<Right style="1"/>
</Border>
</Style>
</StyleList>
<heightRestrict heightrestrict="false"/>
<heightPercent heightpercent="0.75"/>
<ElementCaseMobileAttrProvider horizontal="1" vertical="1" zoom="true" refresh="false" isUseHTML="false" isMobileCanvasSize="false" appearRefresh="false" allowFullScreen="false" allowDoubleClickOrZoom="true" functionalWhenUnactivated="false"/>
<MobileFormCollapsedStyle class="com.fr.form.ui.mobile.MobileFormCollapsedStyle">
<collapseButton showButton="true" color="-6710887" foldedHint="" unfoldedHint="" defaultState="0"/>
<collapsedWork value="false"/>
<lineAttr number="1"/>
</MobileFormCollapsedStyle>
</body>
</InnerWidget>
<BoundsAttr x="0" y="23" width="360" height="221"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.container.WAbsoluteLayout">
<WidgetName name="absolute0"/>
<WidgetID widgetID="0915df26-b845-458f-a8a4-72b00c92d808"/>
<WidgetAttr aspectRatioLocked="false" aspectRatioBackup="-1.0" description="">
<MobileBookMark useBookMark="false" bookMarkName="" frozen="false"/>
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[New Title]]></O>
<FRFont name="Arial" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LCAttr vgap="0" hgap="0" compInterval="0"/>
<ShowBookmarks showBookmarks="false"/>
<Sorted sorted="false"/>
<MobileWidgetList/>
<FrozenWidgets/>
<MobileBookMarkStyle class="com.fr.form.ui.mobile.impl.DefaultMobileBookMarkStyle"/>
<WidgetScalingAttr compState="0"/>
<DesignResolution absoluteResolutionScaleW="1920" absoluteResolutionScaleH="1080"/>
</InnerWidget>
<BoundsAttr x="0" y="264" width="360" height="21"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.Label">
<WidgetName name="item_id"/>
<WidgetID widgetID="180fc108-c3a2-4356-b6e4-33e7eafb10b2"/>
<WidgetAttr invisible="true" aspectRatioLocked="false" aspectRatioBackup="-1.0" description="">
<MobileBookMark useBookMark="false" bookMarkName="" frozen="false"/>
<PrivilegeControl/>
</WidgetAttr>
<widgetValue>
<databinding>
<![CDATA[{Name:ds1,Key:id}]]></databinding>
</widgetValue>
<LabelAttr verticalcenter="true" textalign="0" autoline="true"/>
<FRFont name="SimSun" style="0" size="72"/>
<border style="0" color="-723724"/>
</InnerWidget>
<BoundsAttr x="0" y="244" width="360" height="20"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.FreeButton">
<Listener event="click" name="Click1">
<JavaScript class="com.fr.js.JavaScriptImpl">
<Parameters>
<Parameter>
<Attributes name="item_id"/>
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=$item_id]]></Attributes>
</O>
</Parameter>
<Parameter>
<Attributes name="transaction_type"/>
<O t="I">
<![CDATA[1]]></O>
</Parameter>
</Parameters>
<Content>
<![CDATA[FR.mobilePopup({
	target: "template",
	parameters: {
		'item_id':item_id,
		'transaction_type':transaction_type
		},
	setting: {
		templatePath: "/transactions/transact.frm",     
		border: {
			type: 0,
			color: "rgb(0,0,0)",
			borderRadius: 4.0
		},
		background: {
			color: "rgb(255,255,255)"
		},
		mobileRegular: {
			type: "custom" || "auto_height",
			heightPercent: 95.0,
			widthPercent: 95.0
		},
		padRegular: {
			type: "custom" || "auto_height",
			heightPercent: 95.0,
			widthPercent: 95.0
		}
	}
});]]></Content>
</JavaScript>
</Listener>
<WidgetName name="issuance"/>
<WidgetID widgetID="f39a5b2a-88cb-488e-ae7b-fada117819b6"/>
<WidgetAttr aspectRatioLocked="false" aspectRatioBackup="-1.0" description="">
<MobileBookMark useBookMark="false" bookMarkName="button1" frozen="false"/>
<PrivilegeControl/>
</WidgetAttr>
<Text>
<![CDATA[ISSUANCE]]></Text>
<Hotkeys>
<![CDATA[]]></Hotkeys>
</InnerWidget>
<BoundsAttr x="90" y="285" width="90" height="241"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.FreeButton">
<Listener event="click" name="Click1">
<JavaScript class="com.fr.js.JavaScriptImpl">
<Parameters>
<Parameter>
<Attributes name="item_id"/>
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=$item_id]]></Attributes>
</O>
</Parameter>
<Parameter>
<Attributes name="transaction_type"/>
<O t="I">
<![CDATA[2]]></O>
</Parameter>
</Parameters>
<Content>
<![CDATA[FR.mobilePopup({
	target: "template",
	parameters: {
		'item_id':item_id,
		'transaction_type':transaction_type
		},
	setting: {
		templatePath: "/transactions/transact.frm",     
		border: {
			type: 0,
			color: "rgb(0,0,0)",
			borderRadius: 4.0
		},
		background: {
			color: "rgb(255,255,255)"
		},
		mobileRegular: {
			type: "custom" || "auto_height",
			heightPercent: 95.0,
			widthPercent: 95.0
		},
		padRegular: {
			type: "custom" || "auto_height",
			heightPercent: 95.0,
			widthPercent: 95.0
		}
	}
});]]></Content>
</JavaScript>
</Listener>
<WidgetName name="receiving"/>
<WidgetID widgetID="7f085e33-abf1-4a9d-a8ea-798c6a41aed7"/>
<WidgetAttr aspectRatioLocked="false" aspectRatioBackup="-1.0" description="">
<MobileBookMark useBookMark="false" bookMarkName="button0" frozen="false"/>
<PrivilegeControl/>
</WidgetAttr>
<Text>
<![CDATA[RECEIVING]]></Text>
<Hotkeys>
<![CDATA[]]></Hotkeys>
</InnerWidget>
<BoundsAttr x="0" y="285" width="90" height="241"/>
</Widget>
<ShowBookmarks showBookmarks="false"/>
<Sorted sorted="true"/>
<MobileWidgetList>
<Widget widgetName="report3"/>
<Widget widgetName="item_id"/>
<Widget widgetName="button2"/>
<Widget widgetName="absolute0"/>
<Widget widgetName="receiving"/>
<Widget widgetName="issuance"/>
<Widget widgetName="borrow"/>
<Widget widgetName="return"/>
</MobileWidgetList>
<FrozenWidgets/>
<MobileBookMarkStyle class="com.fr.form.ui.mobile.impl.SidebarMobileBookMarkStyle">
<SidebarMobileBookMarkStyle width="80" height="38" gap="5" borderRadius="2" backgroundColor="-6645094" opacity="50" borderLineStyle="0" borderColor="0" fontFamily="SimSun" fontSize="12" fontColor="-1" fontItalic="false" fontBold="false" selectedBackgroundColor="-14701083" selectedOpacity="85" selectedBorderLineStyle="0" selectedBorderColor="0" selectedFontFamily="SimSun" selectedFontSize="12" selectedFontColor="-1" selectedFontItalic="false" selectedFontBold="false"/>
</MobileBookMarkStyle>
<WidgetZoomAttr compState="1"/>
<AppRelayout appRelayout="false"/>
<Size width="360" height="526"/>
<ResolutionScalingAttr percent="1.2"/>
<BodyLayoutType type="0"/>
</Center>
</Layout>
<DesignerVersion DesignerVersion="KAA"/>
<PreviewType PreviewType="4"/>
<WatermarkAttr class="com.fr.base.iofile.attr.WatermarkAttr">
<WatermarkAttr fontSize="20" color="-6710887" horizontalGap="200" verticalGap="100" valid="false">
<Text>
<![CDATA[]]></Text>
</WatermarkAttr>
</WatermarkAttr>
<MobileOnlyTemplateAttrMark class="com.fr.base.iofile.attr.MobileOnlyTemplateAttrMark"/>
<TemplateCloudInfoAttrMark class="com.fr.plugin.cloud.analytics.attr.TemplateInfoAttrMark" pluginID="com.fr.plugin.cloud.analytics.v10" plugin-version="2.7.0.20220615">
<TemplateCloudInfoAttrMark createTime="1654737219260"/>
</TemplateCloudInfoAttrMark>
<TemplateIdAttMark class="com.fr.base.iofile.attr.TemplateIdAttrMark">
<TemplateIdAttMark TemplateId="0fbdc9fd-670c-4e9e-b9a3-5f02664ce203"/>
</TemplateIdAttMark>
</Form>
