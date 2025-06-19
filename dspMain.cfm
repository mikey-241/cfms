

<cfquery name="getUpickitAdmins" datasource="cmdb_pm">
	SELECT
    	*
    FROM
    	UPICKIT_ADMINS
    WHERE
    	lower(UPICKIT_ADMINS_ATTUID) = <cfqueryparam value="#lcase(cookie.user_attuid)#" cfsqltype="cf_sql_varchar">
</cfquery>

<cfoutput>

<!--- Adding condition for ticket Id - 1596678 By NM6475 --->
<cfif myFusebox.thisFuseaction neq "runMyDodReports" AND myFusebox.thisFuseaction neq "bkupStatusReportInline">
<div style="display:block;"><!--- Used http://www.cssmenubuilder.com to create menu images --->
	<ul class="adminMenu">
    	<!---<li>
        	<a href="#myself##xfa.link1#"><span>Report 1</span></a>
        </li>
        <li>
            <a href="#myself##xfa.link2#"><span>Report 2</span></a>
        </li>
        <li>
            <a href="#myself##xfa.link3#"><span>Admin for Report 3</span></a>
        </li>
        <li>
            <a href="#myself##xfa.link4#"><span>Report 4</span></a>
        </li>--->
        <li>
            <a href="#myself##xfa.link5#" class="<cfif myFusebox.thisFuseaction eq "report5" or myFusebox.thisFuseaction eq "dspSearchResults5" or myFusebox.thisFuseaction eq "main">active</cfif>"><span>uPickit</span></a>
        </li>
        <!--- DoD Reporting --->
		<!--- Request 1169384 - Added active stylesheet for Staged Reports --->
        <li>
            <a href="#myself##xfa.linkDoD#" class="<cfif myFusebox.thisFuseaction eq "dspDoDReporting" or myFusebox.thisFuseaction eq "getDoDResults" or myFusebox.thisFuseaction eq "dspStagedRpts">active</cfif>"><span>DoD Reporting</span></a>
        </li>
        <cfif getUpickitAdmins.recordcount GT 0>
        	<!---<li>
                <a href="#myself##xfa.assetSearch#" class="<cfif myFusebox.thisFuseaction eq "report3"> active</cfif>"><span>Name Search</span></a>
            </li>--->
        </cfif>
        <li>
            <a href="#myself##xfa.link6#" class="<cfif myFusebox.thisFuseaction eq "dspMyReports"> active</cfif>"><span>My Reports</span></a>
        </li>
        <cfif getUpickitAdmins.recordcount GT 0>
        <li>
            <a href="#myself##xfa.link8#" class="<cfif myFusebox.thisFuseaction eq "report3"> active</cfif>"><span>Admin</span></a>
        </li>            
        </cfif>
    </ul>
</div>
#udfAnnouncements('ADHOCREPORTMAIN')#
<br />
</cfif>
<!--- Adding condition for ticket Id - 1596678 By NM6475 code ends  --->
</cfoutput>