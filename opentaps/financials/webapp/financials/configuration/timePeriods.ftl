<#--
 * Copyright (c) Open Source Strategies, Inc.
 *
 * Opentaps is free software: you can redistribute it and/or modify it
 * under the terms of the GNU Affero General Public License as published
 * by the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * Opentaps is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Affero General Public License for more details.
 *
 * You should have received a copy of the GNU Affero General Public License
 * along with Opentaps.  If not, see <http://www.gnu.org/licenses/>.
 *  
-->

<@import location="component://opentaps-common/webapp/common/includes/lib/opentapsFormMacros.ftl"/>

<#-- TODO: probably some kind of permission checking to see that this userLogin can view such and such reports -->
<style>
  A.buttontext{
    color: #235B4E;
    padding: 0px;
}
</style>
<div class="tabletext">

<script type="text/javascript">
function submitReconcile(form) {
  form.action="<@ofbizUrl>ReconcileGlAccountOrganization</@ofbizUrl>";
  form.submit();
}

function submitViewBalance(form) {
  form.action="<@ofbizUrl>viewGlAccountBalance</@ofbizUrl>";
  form.submit();
}
</script>

<#if closedTimePeriods?has_content>
<p>${uiLabelMap.CommonTimePeriodsClosed}
<ul type="circle" id="anio1">
<#list closedTimePeriods as timePeriod>
<!--<li>${timePeriod.periodName?if_exists} <#if timePeriod.periodNum?has_content>${timePeriod.periodNum?string("####")}</#if> (${timePeriod.getRelatedOne("PeriodType").description} ${uiLabelMap.CommonFrom} ${timePeriod.fromDate} ${uiLabelMap.CommonTo} ${timePeriod.thruDate})-->
  <script>
    document.addEventListener
    ('DOMContentLoaded', (event) =>
      {
        const mes = "${timePeriod.periodName?if_exists}";
        const fecha_ciclo = "${getLocalizedDate(timePeriod.fromDate, "DATE_ONLY")}";
        fecha_ini = fecha_ciclo.replace(/\D/g, ' ');
        var componentes = fecha_ini.split(' ');
        var ciclo = (componentes[6]);
        const anio = document.getElementById("anio1");
        if (mes == ""){
          anio.innerHTML += "<li>A&ntilde;o Fiscal" + mes + " " + ciclo + " </li>"; 
        }if (mes != ""){
          anio.innerHTML += "<li>" + mes + " " + ciclo + " </li>";
        }
      }
    );
  </script>
</#list>
</ul></p>
<p>
<#else>
<p>${uiLabelMap.CommonCurrentTimePeriodsNotClosed}</p>
</#if>

<#if (openTimePeriodsSortedByThruDate?has_content) && (openTimePeriodsSortedByThruDate.size() gt 0)>
<#assign timePeriod = openTimePeriodsSortedByThruDate.get(0)>
<@form name="closeAllTimePeriodsAction" url="closeAllTimePeriods" organizationPartyId=organizationPartyId customTimePeriodId=timePeriod.customTimePeriodId />
<@submitFormLink form="closeAllTimePeriodsAction" text="${uiLabelMap.CommonCloseTimePeriods} ${timePeriod.thruDate}" />
</p>
<#else>
<p>${uiLabelMap.CommonNoTimePeriodsToClose}</p>
</#if>

<#if openTimePeriods?has_content>
<p>${uiLabelMap.CommonOpenTimePeriods}
<ul type="circle" id="anio">
<#list openTimePeriods as timePeriod>
  <#--<li>${timePeriod.periodName?if_exists} <#if timePeriod.periodNum?has_content>${timePeriod.periodNum?string("####")}</#if> (${timePeriod.getRelatedOne("PeriodType").description} ${uiLabelMap.CommonFrom} ${getLocalizedDate(timePeriod.fromDate, "DATE_ONLY")} ${uiLabelMap.CommonTo} ${getLocalizedDate(timePeriod.thruDate, "DATE_ONLY")})-->
  <script>
    document.addEventListener
    ('DOMContentLoaded', (event) =>
      {
        const mes = "${timePeriod.periodName?if_exists}";
        const fecha_ciclo = "${getLocalizedDate(timePeriod.fromDate, "DATE_ONLY")}";
        fecha_ini = fecha_ciclo.replace(/\D/g, ' ');
        var componentes = fecha_ini.split(' ');
        var ciclo = (componentes[6]);
        const anio = document.getElementById("anio");
        if (mes == ""){
          anio.innerHTML += "<li>A&ntilde;o Fiscal" + mes + " " + ciclo + " </li>"; 
        }if (mes != ""){
          anio.innerHTML += "<li>" + mes + " " + ciclo + " </li>";
        }
      }
    );
  </script>
</#list>

</ul></p>
<p>
<#else>
<p>${uiLabelMap.CommonNoOpenTimePeriods}</p>
</#if>
</div>
