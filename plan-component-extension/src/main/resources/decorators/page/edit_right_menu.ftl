<!-- BEGIN THEME PANEL -->
<div class="theme-panel hidden-xs hidden-sm">
    <div class="toggler"> </div>
    <div class="toggler-close"> </div>
    <div class="theme-options">
        <div class="theme-option theme-colors clearfix">
            <span> 编制目录 </span>
        </div>
        <div class="theme-option">
	        <div class="portlet light bordered">
	            <div class="portlet-title">
	                <div class="caption">
	                    <i class="icon-social-dribbble font-blue-sharp"></i>
	                    <span class="caption-subject font-blue-sharp bold uppercase">Default Tree</span>
	                </div>
	                <div class="actions">
	                    <a class="btn btn-circle btn-icon-only btn-default" href="javascript:;">
	                        <i class="icon-cloud-upload"></i>
	                    </a>
	                    <a class="btn btn-circle btn-icon-only btn-default" href="javascript:;">
	                        <i class="icon-wrench"></i>
	                    </a>
	                    <a class="btn btn-circle btn-icon-only btn-default" href="javascript:;">
	                        <i class="icon-trash"></i>
	                    </a>
	                </div>
	            </div>
	            <div class="portlet-body">
	                <div id="tree_1" class="tree-demo">
	                    <ul>
	                        <li> Root node 1
	                            <ul>
	                                <li data-jstree='{ "selected" : true }'>
	                                    <a href="javascript:;"> Initially selected </a>
	                                </li>
	                                <li data-jstree='{ "icon" : "fa fa-briefcase icon-state-success " }'> custom icon URL </li>
	                                <li data-jstree='{ "opened" : true }'> initially open
	                                    <ul>
	                                        <li data-jstree='{ "disabled" : true }'> Disabled Node </li>
	                                        <li data-jstree='{ "type" : "file" }'> Another node </li>
	                                    </ul>
	                                </li>
	                                <li data-jstree='{ "icon" : "fa fa-warning icon-state-danger" }'> Custom icon class (bootstrap) </li>
	                            </ul>
	                        </li>
	                        <li data-jstree='{ "type" : "file" }'>
	                            <a href="http://www.jstree.com"> Clickanle link node </a>
	                        </li>
	                    </ul>
	                </div>
	            </div>
	        </div>  
        </div>
    </div>
</div>
<!-- END THEME PANEL -->                          
