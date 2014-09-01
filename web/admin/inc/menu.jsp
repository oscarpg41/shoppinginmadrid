<nav>    
    <ul class="nav">
      <!-- A R E A -->  
      <li class="areamenu">
        <html:link forward="area_menu" styleClass="desplegable"><bean:message key="admin.menu.area"/></html:link>      

        <ul class="submenu">
            <li><html:link forward="area_new"><bean:message key="admin.menu.new"/></html:link></li>
            <li><html:link forward="area_update"><bean:message key="admin.menu.update"/></html:link></li>
            <li><html:link forward="area_delete"><bean:message key="admin.menu.delete"/></html:link></li>
        </ul>
      </li>

      <!-- S T R E E T -->
      <li class="streetmenu">
        <html:link forward="street_menu" styleClass="desplegable"><bean:message key="admin.menu.streets"/></html:link>      

        <ul class="submenu">
            <li><html:link forward="street_new"><bean:message key="admin.menu.new"/></html:link></li>
            <li><html:link forward="street_update"><bean:message key="admin.menu.update"/></html:link></li>
            <li><html:link forward="street_delete"><bean:message key="admin.menu.delete"/></html:link></li>
        </ul>
      </li>  

      <!-- T Y P E   S H O P -->  
      <li class="typeshop">
        <html:link forward="typeShop_menu" styleClass="desplegable"><bean:message key="admin.menu.typeShop"/></html:link>      

        <ul class="submenu">
            <li><html:link forward="typeShop_new"><bean:message key="admin.menu.new"/></html:link></li>
            <li><html:link forward="typeShop_update"><bean:message key="admin.menu.update"/></html:link></li>
            <li><html:link forward="typeShop_delete"><bean:message key="admin.menu.delete"/></html:link></li>
        </ul>
      </li>


      <!-- D E P A R T A M E N T -->  
      <li class="department">
        <html:link forward="department_menu" styleClass="desplegable"><bean:message key="admin.menu.department"/></html:link>      

        <ul class="submenu">
            <li><html:link forward="department_new"><bean:message key="admin.menu.new"/></html:link></li>
            <li><html:link forward="department_update"><bean:message key="admin.menu.update"/></html:link></li>
            <li><html:link forward="department_delete"><bean:message key="admin.menu.delete"/></html:link></li>
        </ul>
      </li> 

      
      <!-- M A L L S -->  
      <li class="malls">
        <html:link forward="mall_menu" styleClass="desplegable"><bean:message key="admin.menu.mall"/></html:link>      

        <ul class="submenu">
            <li><html:link forward="mall_new"><bean:message key="admin.menu.new"/></html:link></li>
            <li><html:link forward="mall_update"><bean:message key="admin.menu.update"/></html:link></li>
            <li><html:link forward="mall_delete"><bean:message key="admin.menu.delete"/></html:link></li>
        </ul>
      </li      
      

      <!-- M A R K E T S -->  
      <li class="markets">
        <html:link forward="market_menu" styleClass="desplegable"><bean:message key="admin.menu.markets"/></html:link>      

        <ul class="submenu">
            <li><html:link forward="market_new"><bean:message key="admin.menu.new"/></html:link></li>
            <li><html:link forward="market_update"><bean:message key="admin.menu.update"/></html:link></li>
            <li><html:link forward="market_delete"><bean:message key="admin.menu.delete"/></html:link></li>
        </ul>
      </li>
      
      <!-- S H O P S -->  
      <li class="shops">
        <html:link forward="market_menu" styleClass="desplegable"><bean:message key="admin.menu.shops"/></html:link>      

        <ul class="submenu">
            <li><html:link forward="shop_new"><bean:message key="admin.menu.new"/></html:link></li>
            <li><html:link forward="shop_update"><bean:message key="admin.menu.update"/> / <bean:message key="admin.menu.delete"/></html:link></li>
        </ul>
      </li>      
      
      <li><html:link forward="closeSession"><bean:message key="admin.menu.close"/></html:link></li>
 
    </ul>
</nav>
