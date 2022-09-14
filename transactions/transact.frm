<?xml version="1.0" encoding="UTF-8"?>
<Form xmlVersion="20211223" releaseVersion="10.0.0">
<TableDataMap>
<TableData name="requestor" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="requestor_id"/>
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
<![CDATA[SELECT * FROM [dbo]A.[requestors]A
where id='${requestor_id}']]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
<TableData name="transaction type" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="transaction_type"/>
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
<![CDATA[SELECT * FROM [dbo]A.[transaction_types]A
where id = '${transaction_type}']]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
<TableData name="item" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="item_id"/>
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
<![CDATA[SELECT 
	part_number,
	description,
	total
FROM dbo.item_details_view
where id = '${item_id}']]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
</TableDataMap>
<FormMobileAttr>
<FormMobileAttr refresh="false" isUseHTML="false" isMobileOnly="true" isAdaptivePropertyAutoMatch="true" appearRefresh="false" promptWhenLeaveWithoutSubmit="false" allowDoubleClickOrZoom="false"/>
</FormMobileAttr>
<Parameters/>
<Layout class="com.fr.form.ui.container.WBorderLayout">
<WidgetName name="form"/>
<WidgetAttr aspectRatioLocked="false" aspectRatioBackup="-1.0" description="">
<CustomTitleName name="Transaction"/>
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
<Center class="com.fr.form.ui.container.WFitLayout">
<WidgetName name="body"/>
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
<appFormBodyPadding class="com.fr.base.iofile.attr.FormBodyPaddingAttrMark">
<appFormBodyPadding interval="0">
<Margin top="4" left="4" bottom="4" right="4"/>
</appFormBodyPadding>
</appFormBodyPadding>
<LCAttr vgap="0" hgap="0" compInterval="0"/>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.container.WAbsoluteBodyLayout">
<WidgetName name="body"/>
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
<Background name="ColorBackground" color="-657929"/>
<Alpha alpha="0.5"/>
</Border>
<LCAttr vgap="0" hgap="0" compInterval="0"/>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.Label">
<WidgetName name="transaction_type_id"/>
<WidgetID widgetID="8afcf0b1-d932-4851-8da3-9c42a874d2fe"/>
<WidgetAttr invisible="true" aspectRatioLocked="false" aspectRatioBackup="-1.0" description="">
<MobileBookMark useBookMark="false" bookMarkName="" frozen="false"/>
<PrivilegeControl/>
</WidgetAttr>
<widgetValue>
<databinding>
<![CDATA[{Name:transaction type,Key:id}]]></databinding>
</widgetValue>
<LabelAttr verticalcenter="true" textalign="0" autoline="true"/>
<FRFont name="SimSun" style="0" size="72"/>
<border style="0" color="-723724"/>
</InnerWidget>
<BoundsAttr x="7" y="578" width="80" height="21"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.FreeButton">
<Listener event="click" name="Validation">
<JavaScript class="com.fr.js.JavaScriptImpl">
<Parameters/>
<Content>
<![CDATA[var quantity = this.options.form.getWidgetByName("quantity").getValue();
var total = this.options.form.getWidgetByName("total").getValue();
var submitBtn = this.options.form.getWidgetByName("real_submit");
var transaction = this.options.form.getWidgetByName("transaction_type_id").getValue();

var req = this.options.form.getWidgetByName("requestor_id").getValue();
var loc = this.options.form.getWidgetByName("location_id").getValue();
var error = false;
var error_msg = "";

if(req == ""){
	error = true;
	error_msg += "Requestor is required.\n";
}

if(loc == ""){
	error = true;
	error_msg += "Location is required.\n";
}

if(quantity == 0 || quantity == ""){
	error = true;
	error_msg += "Quantity must not be empty or zero.\n";
}

if(error == true)
{
	FR.Msg.alert("Warning",error_msg);
}
else {
	if(transaction == 1 || transaction == 3){
		if(quantity <= total)
		{
			submitBtn.fireEvent("click");
		}
		else {
			FR.Msg.alert("Error","Quantity must not greater than the stocks");
		}
	}
	else{
		submitBtn.fireEvent("click");
	}
}

]]></Content>
</JavaScript>
</Listener>
<WidgetName name="submit"/>
<WidgetID widgetID="0f3efe97-4dc6-4571-a4be-f935902fec37"/>
<WidgetAttr aspectRatioLocked="false" aspectRatioBackup="-1.0" description="">
<MobileBookMark useBookMark="false" bookMarkName="" frozen="false"/>
<PrivilegeControl/>
</WidgetAttr>
<Text>
<![CDATA[Submit]]></Text>
<Hotkeys>
<![CDATA[]]></Hotkeys>
</InnerWidget>
<BoundsAttr x="1" y="654" width="443" height="32"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.Label">
<WidgetName name="total"/>
<WidgetID widgetID="4729b4e2-01a1-4bae-ae03-57c05e38851d"/>
<WidgetAttr invisible="true" aspectRatioLocked="false" aspectRatioBackup="-1.0" description="">
<MobileBookMark useBookMark="false" bookMarkName="" frozen="false"/>
<PrivilegeControl/>
</WidgetAttr>
<widgetValue>
<databinding>
<![CDATA[{Name:item,Key:total}]]></databinding>
</widgetValue>
<LabelAttr verticalcenter="true" textalign="4" autoline="true"/>
<FRFont name="SimSun" style="0" size="72"/>
<border style="0" color="-723724"/>
</InnerWidget>
<BoundsAttr x="93" y="578" width="71" height="21"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.Label">
<WidgetName name="requestor"/>
<WidgetID widgetID="48571550-ffba-4d46-80bb-4cfbde572dd4"/>
<WidgetAttr invisible="true" aspectRatioLocked="false" aspectRatioBackup="-1.0" description="">
<MobileBookMark useBookMark="false" bookMarkName="" frozen="false"/>
<PrivilegeControl/>
</WidgetAttr>
<widgetValue>
<databinding>
<![CDATA[{Name:requestor,Key:id}]]></databinding>
</widgetValue>
<LabelAttr verticalcenter="true" textalign="0" autoline="true"/>
<FRFont name="SimSun" style="0" size="72"/>
<border style="0" color="-723724"/>
</InnerWidget>
<BoundsAttr x="210" y="221" width="80" height="21"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.FreeButton">
<Listener event="click" name="Submit Requestor">
<JavaScript class="com.fr.js.Commit2DBJavaScript">
<Parameters/>
<Attributes dsName="cms_dev" name="Submit1"/>
<DMLConfig class="com.fr.write.config.InsertConfig">
<Table schema="" name="requestors"/>
<ColumnConfig name="name" isKey="false" skipUnmodified="false">
<O t="XMLable" class="com.fr.stable.js.WidgetName">
<WidetName name="requestor_id"/>
</O>
</ColumnConfig>
<Condition class="com.fr.data.condition.ListCondition"/>
</DMLConfig>
<JavaScript class="com.fr.js.JavaScriptImpl">
<Parameters/>
<Content>
<![CDATA[this.options.form.getWidgetByName("addbtn").setEnable(false);
this.options.form.getWidgetByName("addbtn").setValue('Saving');
    if (fr_submitinfo.success) {  
        	FR.Msg.toast('Submitted successfully. Reloading form...');
    } else {  
        	FR.Msg.toast('Submission Failed');
    }
    location.reload();]]></Content>
</JavaScript>
<JavaScriptResourceInfo/>
</JavaScript>
</Listener>
<WidgetName name="addbtn"/>
<WidgetID widgetID="633c8802-e926-4a06-8e2e-390adb81e056"/>
<WidgetAttr disabled="true" aspectRatioLocked="false" aspectRatioBackup="-1.0" description="">
<MobileBookMark useBookMark="false" bookMarkName="" frozen="false"/>
<PrivilegeControl/>
</WidgetAttr>
<Text>
<![CDATA[Add]]></Text>
<Hotkeys>
<![CDATA[]]></Hotkeys>
<IconName>
<![CDATA[add]]></IconName>
</InnerWidget>
<BoundsAttr x="364" y="185" width="80" height="30"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.Label">
<WidgetName name="label4"/>
<WidgetID widgetID="8398c5eb-b3c9-4976-a6c8-5c44017005f9"/>
<WidgetAttr invisible="true" aspectRatioLocked="false" aspectRatioBackup="-1.0" description="">
<MobileBookMark useBookMark="false" bookMarkName="" frozen="false"/>
<PrivilegeControl/>
</WidgetAttr>
<widgetValue>
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[='Creator: '+GetRealName($fine_username)]]></Attributes>
</O>
</widgetValue>
<LabelAttr verticalcenter="true" textalign="0" autoline="true"/>
<FRFont name="SimSun" style="0" size="128"/>
<border style="0" color="-723724"/>
</InnerWidget>
<BoundsAttr x="1" y="609" width="443" height="45"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.Label">
<WidgetName name="label3"/>
<WidgetID widgetID="612ded8e-f08d-4310-8a5f-fec963fadb32"/>
<WidgetAttr aspectRatioLocked="false" aspectRatioBackup="-1.0" description="">
<MobileBookMark useBookMark="false" bookMarkName="" frozen="false"/>
<PrivilegeControl/>
</WidgetAttr>
<widgetValue>
<databinding>
<![CDATA[{Name:item,Key:description}]]></databinding>
</widgetValue>
<LabelAttr verticalcenter="true" textalign="0" autoline="true"/>
<FRFont name="SimSun" style="0" size="128"/>
<border style="0" color="-723724"/>
</InnerWidget>
<BoundsAttr x="0" y="96" width="444" height="77"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.Label">
<WidgetName name="label2"/>
<WidgetID widgetID="0891d5c6-ca7c-4fa0-a5ed-e84078afc472"/>
<WidgetAttr aspectRatioLocked="false" aspectRatioBackup="-1.0" description="">
<MobileBookMark useBookMark="false" bookMarkName="" frozen="false"/>
<PrivilegeControl/>
</WidgetAttr>
<widgetValue>
<databinding>
<![CDATA[{Name:item,Key:part_number}]]></databinding>
</widgetValue>
<LabelAttr verticalcenter="true" textalign="0" autoline="true"/>
<FRFont name="SimSun" style="0" size="160"/>
<border style="0" color="-723724"/>
</InnerWidget>
<BoundsAttr x="71" y="61" width="303" height="35"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.Label">
<WidgetName name="label1"/>
<WidgetID widgetID="e075c997-02f0-45f1-af3d-33f07e9bae59"/>
<WidgetAttr aspectRatioLocked="false" aspectRatioBackup="-1.0" description="">
<MobileBookMark useBookMark="false" bookMarkName="label1" frozen="false"/>
<PrivilegeControl/>
</WidgetAttr>
<widgetValue>
<O>
<![CDATA[Requestor:]]></O>
</widgetValue>
<LabelAttr verticalcenter="true" textalign="0" autoline="true"/>
<FRFont name="SimSun" style="0" size="128"/>
<border style="0" color="-723724"/>
</InnerWidget>
<BoundsAttr x="0" y="173" width="192" height="52"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.Label">
<WidgetName name="label1_c"/>
<WidgetID widgetID="e075c997-02f0-45f1-af3d-33f07e9bae59"/>
<WidgetAttr aspectRatioLocked="false" aspectRatioBackup="-1.0" description="">
<MobileBookMark useBookMark="false" bookMarkName="label1" frozen="false"/>
<PrivilegeControl/>
</WidgetAttr>
<widgetValue>
<O>
<![CDATA[Station:]]></O>
</widgetValue>
<LabelAttr verticalcenter="true" textalign="0" autoline="true"/>
<FRFont name="SimSun" style="0" size="128"/>
<border style="0" color="-723724"/>
</InnerWidget>
<BoundsAttr x="0" y="305" width="192" height="52"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.Label">
<WidgetName name="label1_c_c_c_c_c"/>
<WidgetID widgetID="e075c997-02f0-45f1-af3d-33f07e9bae59"/>
<WidgetAttr aspectRatioLocked="false" aspectRatioBackup="-1.0" description="">
<MobileBookMark useBookMark="false" bookMarkName="label1" frozen="false"/>
<PrivilegeControl/>
</WidgetAttr>
<widgetValue>
<O>
<![CDATA[Quantity:]]></O>
</widgetValue>
<LabelAttr verticalcenter="true" textalign="0" autoline="true"/>
<FRFont name="SimSun" style="0" size="128"/>
<border style="0" color="-723724"/>
</InnerWidget>
<BoundsAttr x="0" y="439" width="192" height="52"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.NumberEditor">
<WidgetName name="quantity"/>
<WidgetID widgetID="26006783-026a-49ae-96ef-531677e43e3d"/>
<WidgetAttr aspectRatioLocked="false" aspectRatioBackup="-1.0" description="">
<MobileBookMark useBookMark="false" bookMarkName="" frozen="false"/>
<PrivilegeControl/>
<MobileStyle class="com.fr.form.ui.mobile.DefaultMobileStyle" isCustom="false" borderType="2" borderRadius="2.0" iconColor="-14701083">
<Background name="ColorBackground" color="-1"/>
<FRFont name="SimSun" style="0" size="128"/>
</MobileStyle>
</WidgetAttr>
<EMSG>
<![CDATA[Quantity must not be 0]]></EMSG>
<NumberAttr maxDecimalLength="0" allowNegative="false">
<widgetValue>
<O t="D">
<![CDATA[0.0]]></O>
</widgetValue>
</NumberAttr>
</InnerWidget>
<BoundsAttr x="192" y="449" width="252" height="32"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.Label">
<WidgetName name="label0"/>
<WidgetID widgetID="dc763fe1-ec40-45ec-8eb1-95ea5776fce0"/>
<WidgetAttr aspectRatioLocked="false" aspectRatioBackup="-1.0" description="">
<MobileBookMark useBookMark="false" bookMarkName="label0" frozen="false"/>
<PrivilegeControl/>
</WidgetAttr>
<widgetValue>
<databinding>
<![CDATA[{Name:transaction type,Key:name}]]></databinding>
</widgetValue>
<LabelAttr verticalcenter="true" textalign="0" autoline="true"/>
<FRFont name="SimSun" style="1" size="200"/>
<border style="0" color="-723724"/>
</InnerWidget>
<BoundsAttr x="0" y="1" width="444" height="60"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.ComboBox">
<Listener event="stopedit" name="Edit End1">
<JavaScript class="com.fr.js.JavaScriptImpl">
<Parameters/>
<Content>
<![CDATA[var r = this.options.form.getWidgetByName("requestor").getValue();
var i = this.options.form.getWidgetByName("requestor_id").getValue();
if(i != '' && (r == '' || r ==  null)){
	this.options.form.getWidgetByName("addbtn").setEnable(true);
	this.options.form.getWidgetByName("submit").setEnable(false);
}
else{
	this.options.form.getWidgetByName("addbtn").setEnable(false);
	this.options.form.getWidgetByName("submit").setEnable(true);
}
]]></Content>
</JavaScript>
</Listener>
<WidgetName name="requestor_id"/>
<WidgetID widgetID="9fe84d89-4d2a-4783-827c-5e50ff377bdb"/>
<WidgetAttr aspectRatioLocked="false" aspectRatioBackup="-1.0" description="">
<MobileBookMark useBookMark="false" bookMarkName="comboBox0" frozen="false"/>
<PrivilegeControl/>
</WidgetAttr>
<EMSG>
<![CDATA[Requestor is required]]></EMSG>
<DirectEdit>
<![CDATA[false]]></DirectEdit>
<Dictionary class="com.fr.data.impl.DatabaseDictionary">
<FormulaDictAttr kiName="id" viName="name"/>
<DBDictAttr tableName="requestors" schemaName="" ki="-1" vi="-1" kiName="id" viName="name"/>
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
<BoundsAttr x="192" y="184" width="172" height="32"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.Label">
<WidgetName name="label1_c_c"/>
<WidgetID widgetID="e075c997-02f0-45f1-af3d-33f07e9bae59"/>
<WidgetAttr aspectRatioLocked="false" aspectRatioBackup="-1.0" description="">
<MobileBookMark useBookMark="false" bookMarkName="label1" frozen="false"/>
<PrivilegeControl/>
</WidgetAttr>
<widgetValue>
<O>
<![CDATA[Location:]]></O>
</widgetValue>
<LabelAttr verticalcenter="true" textalign="0" autoline="true"/>
<FRFont name="SimSun" style="0" size="128"/>
<border style="0" color="-723724"/>
</InnerWidget>
<BoundsAttr x="0" y="239" width="192" height="52"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.ComboBox">
<WidgetName name="location_id"/>
<WidgetID widgetID="d09ed72a-9f33-41df-9543-5c7f7032e016"/>
<WidgetAttr aspectRatioLocked="false" aspectRatioBackup="-1.0" description="">
<MobileBookMark useBookMark="false" bookMarkName="" frozen="false"/>
<PrivilegeControl/>
</WidgetAttr>
<EMSG>
<![CDATA[Location is required]]></EMSG>
<DirectEdit>
<![CDATA[false]]></DirectEdit>
<CustomData>
<![CDATA[false]]></CustomData>
<Dictionary class="com.fr.data.impl.DatabaseDictionary">
<FormulaDictAttr kiName="id" viName="name"/>
<DBDictAttr tableName="locations" schemaName="" ki="-1" vi="-1" kiName="id" viName="name"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[cms_dev]]></DatabaseName>
</Connection>
</Dictionary>
<widgetValue>
<databinding>
<![CDATA[{}]]></databinding>
</widgetValue>
</InnerWidget>
<BoundsAttr x="192" y="249" width="252" height="32"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.ComboBox">
<WidgetName name="station_id"/>
<WidgetID widgetID="58afdcdb-0b6e-40d7-9751-f38f26ffce0a"/>
<WidgetAttr aspectRatioLocked="false" aspectRatioBackup="-1.0" description="">
<MobileBookMark useBookMark="false" bookMarkName="" frozen="false"/>
<PrivilegeControl/>
</WidgetAttr>
<DirectEdit>
<![CDATA[false]]></DirectEdit>
<CustomData>
<![CDATA[false]]></CustomData>
<Dictionary class="com.fr.data.impl.DatabaseDictionary">
<FormulaDictAttr kiName="id" viName="name"/>
<DBDictAttr tableName="stations" schemaName="" ki="-1" vi="-1" kiName="id" viName="name"/>
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
<BoundsAttr x="192" y="319" width="252" height="32"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.Label">
<WidgetName name="label1_c_c_c"/>
<WidgetID widgetID="e075c997-02f0-45f1-af3d-33f07e9bae59"/>
<WidgetAttr aspectRatioLocked="false" aspectRatioBackup="-1.0" description="">
<MobileBookMark useBookMark="false" bookMarkName="label1" frozen="false"/>
<PrivilegeControl/>
</WidgetAttr>
<widgetValue>
<O>
<![CDATA[Shift:]]></O>
</widgetValue>
<LabelAttr verticalcenter="true" textalign="0" autoline="true"/>
<FRFont name="SimSun" style="0" size="128"/>
<border style="0" color="-723724"/>
</InnerWidget>
<BoundsAttr x="0" y="373" width="192" height="52"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.ComboBox">
<WidgetName name="shift_id"/>
<WidgetID widgetID="6120dd54-b030-408a-aebf-9d2bf7d46e20"/>
<WidgetAttr aspectRatioLocked="false" aspectRatioBackup="-1.0" description="">
<MobileBookMark useBookMark="false" bookMarkName="" frozen="false"/>
<PrivilegeControl/>
</WidgetAttr>
<EMSG>
<![CDATA[Shift is required]]></EMSG>
<DirectEdit>
<![CDATA[false]]></DirectEdit>
<CustomData>
<![CDATA[false]]></CustomData>
<Dictionary class="com.fr.data.impl.DatabaseDictionary">
<FormulaDictAttr kiName="id" viName="name"/>
<DBDictAttr tableName="shifts" schemaName="" ki="-1" vi="-1" kiName="id" viName="name"/>
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
<BoundsAttr x="192" y="384" width="252" height="32"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.Label">
<WidgetName name="label1_c_c_c_c"/>
<WidgetID widgetID="e075c997-02f0-45f1-af3d-33f07e9bae59"/>
<WidgetAttr aspectRatioLocked="false" aspectRatioBackup="-1.0" description="">
<MobileBookMark useBookMark="false" bookMarkName="label1" frozen="false"/>
<PrivilegeControl/>
</WidgetAttr>
<widgetValue>
<O>
<![CDATA[Remarks:]]></O>
</widgetValue>
<LabelAttr verticalcenter="true" textalign="0" autoline="true"/>
<FRFont name="SimSun" style="0" size="128"/>
<border style="0" color="-723724"/>
</InnerWidget>
<BoundsAttr x="0" y="505" width="192" height="52"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.TextArea">
<WidgetName name="remarks"/>
<WidgetID widgetID="4386efbe-a4f0-4dbd-a56f-235cdaafde8b"/>
<WidgetAttr aspectRatioLocked="false" aspectRatioBackup="-1.0" description="">
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
<BoundsAttr x="192" y="505" width="252" height="80"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.FreeButton">
<Listener event="click" name="Disable submit button">
<JavaScript class="com.fr.js.JavaScriptImpl">
<Parameters/>
<Content>
<![CDATA[this.options.form.getWidgetByName("submit").setValue("Processing Please Wait...");
this.options.form.getWidgetByName("submit").setEnable(false);]]></Content>
</JavaScript>
</Listener>
<Listener event="click" name="Submit Transaction">
<JavaScript class="com.fr.js.Commit2DBJavaScript">
<Parameters/>
<Attributes dsName="cms_dev" name="Submit1"/>
<DMLConfig class="com.fr.write.config.InsertConfig">
<Table schema="" name="transactions"/>
<ColumnConfig name="item_id" isKey="false" skipUnmodified="false">
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=$item_id]]></Attributes>
</O>
</ColumnConfig>
<ColumnConfig name="quantity" isKey="false" skipUnmodified="false">
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=if($transaction_type = 1 || $transaction_type = 3,quantity*-1,quantity)]]></Attributes>
</O>
</ColumnConfig>
<ColumnConfig name="requestor_id" isKey="false" skipUnmodified="false">
<O t="XMLable" class="com.fr.stable.js.WidgetName">
<WidetName name="requestor_id"/>
</O>
</ColumnConfig>
<ColumnConfig name="station_id" isKey="false" skipUnmodified="false">
<O t="XMLable" class="com.fr.stable.js.WidgetName">
<WidetName name="station_id"/>
</O>
</ColumnConfig>
<ColumnConfig name="transaction_type_id" isKey="false" skipUnmodified="false">
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=$transaction_type]]></Attributes>
</O>
</ColumnConfig>
<ColumnConfig name="location_id" isKey="false" skipUnmodified="false">
<O t="XMLable" class="com.fr.stable.js.WidgetName">
<WidetName name="location_id"/>
</O>
</ColumnConfig>
<ColumnConfig name="shift_id" isKey="false" skipUnmodified="false">
<O t="XMLable" class="com.fr.stable.js.WidgetName">
<WidetName name="shift_id"/>
</O>
</ColumnConfig>
<ColumnConfig name="remarks" isKey="false" skipUnmodified="false">
<O t="XMLable" class="com.fr.stable.js.WidgetName">
<WidetName name="remarks"/>
</O>
</ColumnConfig>
<ColumnConfig name="user_id" isKey="false" skipUnmodified="false">
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=$fine_username]]></Attributes>
</O>
</ColumnConfig>
<ColumnConfig name="created_at" isKey="false" skipUnmodified="false">
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=NOW()]]></Attributes>
</O>
</ColumnConfig>
<ColumnConfig name="updated_at" isKey="false" skipUnmodified="false">
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=NOW()]]></Attributes>
</O>
</ColumnConfig>
<Condition class="com.fr.data.condition.ListCondition"/>
</DMLConfig>
<JavaScript class="com.fr.js.JavaScriptImpl">
<Parameters/>
<Content>
<![CDATA[    if (fr_submitinfo.success) {  
        FR.Msg.toast('Submitted successfully');
        	var close = function(){FR.closeMobilePopup();}
		setInterval(close,2000)
    } else {  
        	FR.Msg.alert('Submission Failed',fr_submitinfo.failinfo);
        	this.options.form.getWidgetByName("submit").setValue("Submit");
		this.options.form.getWidgetByName("submit").setEnable(true);
    }]]></Content>
</JavaScript>
<JavaScriptResourceInfo/>
</JavaScript>
</Listener>
<WidgetName name="real_submit"/>
<WidgetID widgetID="e7b1b415-70b6-4806-b50f-3fe780ad9c9f"/>
<WidgetAttr invisible="true" aspectRatioLocked="false" aspectRatioBackup="-1.0" description="">
<MobileBookMark useBookMark="false" bookMarkName="" frozen="false"/>
<PrivilegeControl/>
</WidgetAttr>
<Text>
<![CDATA[Submit2]]></Text>
<Hotkeys>
<![CDATA[]]></Hotkeys>
</InnerWidget>
<BoundsAttr x="0" y="686" width="444" height="29"/>
</Widget>
<ShowBookmarks showBookmarks="true"/>
<Sorted sorted="true"/>
<MobileWidgetList>
<Widget widgetName="label1"/>
<Widget widgetName="label1_c"/>
<Widget widgetName="label1_c_c_c_c_c"/>
<Widget widgetName="label0"/>
<Widget widgetName="label1_c_c"/>
<Widget widgetName="label1_c_c_c"/>
<Widget widgetName="label1_c_c_c_c"/>
<Widget widgetName="label2"/>
<Widget widgetName="label3"/>
<Widget widgetName="location_id"/>
<Widget widgetName="quantity"/>
<Widget widgetName="station_id"/>
<Widget widgetName="shift_id"/>
<Widget widgetName="remarks"/>
<Widget widgetName="submit"/>
<Widget widgetName="label4"/>
<Widget widgetName="requestor_id"/>
<Widget widgetName="requestor"/>
<Widget widgetName="addbtn"/>
<Widget widgetName="total"/>
<Widget widgetName="real_submit"/>
<Widget widgetName="transaction_type_id"/>
</MobileWidgetList>
<FrozenWidgets/>
<MobileBookMarkStyle class="com.fr.form.ui.mobile.impl.DefaultMobileBookMarkStyle"/>
<WidgetScalingAttr compState="0"/>
<DesignResolution absoluteResolutionScaleW="1920" absoluteResolutionScaleH="1080"/>
<AppRelayout appRelayout="false"/>
</InnerWidget>
<BoundsAttr x="0" y="0" width="370" height="600"/>
</Widget>
<ShowBookmarks showBookmarks="true"/>
<Sorted sorted="true"/>
<MobileWidgetList/>
<FrozenWidgets/>
<MobileBookMarkStyle class="com.fr.form.ui.mobile.impl.DefaultMobileBookMarkStyle"/>
<WidgetZoomAttr compState="0"/>
<AppRelayout appRelayout="false"/>
<Size width="370" height="600"/>
<ResolutionScalingAttr percent="1.2"/>
<BodyLayoutType type="1"/>
</Center>
</Layout>
<DesignerVersion DesignerVersion="KAA"/>
<PreviewType PreviewType="0"/>
<WatermarkAttr class="com.fr.base.iofile.attr.WatermarkAttr">
<WatermarkAttr fontSize="20" color="-6710887" horizontalGap="200" verticalGap="100" valid="false">
<Text>
<![CDATA[]]></Text>
</WatermarkAttr>
</WatermarkAttr>
<MobileOnlyTemplateAttrMark class="com.fr.base.iofile.attr.MobileOnlyTemplateAttrMark"/>
<TemplateCloudInfoAttrMark class="com.fr.plugin.cloud.analytics.attr.TemplateInfoAttrMark" pluginID="com.fr.plugin.cloud.analytics.v10" plugin-version="2.7.0.20220615">
<TemplateCloudInfoAttrMark createTime="1655273201313"/>
</TemplateCloudInfoAttrMark>
<TemplateIdAttMark class="com.fr.base.iofile.attr.TemplateIdAttrMark">
<TemplateIdAttMark TemplateId="3af61a03-a3c1-4255-99f4-35dbab24534c"/>
</TemplateIdAttMark>
</Form>
