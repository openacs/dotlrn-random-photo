ad_library {
    Procedures for registering implementations for the
    dotlrn random photo portlet package. 
    
    @creation-date June 2003
    @author gmorales@galileo.edu
    @cvs-id $Id$
}

namespace eval dotlrn_random_photo {}

ad_proc -private dotlrn_random_photo::install {} {
    dotLRN Evaluation package install proc
} {
    register_portal_datasource_impl
}

ad_proc -private dotlrn_random_photo::uninstall {} {
    dotLRN Evaluation package uninstall proc
} {
    unregister_portal_datasource_impl
}

ad_proc -private dotlrn_random_photo::register_portal_datasource_impl {} {
    Register the service contract implementation for the dotlrn_applet service contract
} {
    set spec {
        name "dotlrn_random_photo"
	contract_name "dotlrn_applet"
	owner "dotlrn-random-photo"
        aliases {
	    GetPrettyName dotlrn_random_photo::get_pretty_name
	    AddApplet dotlrn_random_photo::add_applet
	    RemoveApplet dotlrn_random_photo::remove_applet
	    AddAppletToCommunity dotlrn_random_photo::add_applet_to_community
	    RemoveAppletFromCommunity dotlrn_random_photo::remove_applet_from_community
	    AddUser dotlrn_random_photo::add_user
	    RemoveUser dotlrn_random_photo::remove_user
	    AddUserToCommunity dotlrn_random_photo::add_user_to_community
	    RemoveUserFromCommunity dotlrn_random_photo::remove_user_from_community
	    AddPortlet dotlrn_random_photo::add_portlet
	    RemovePortlet dotlrn_random_photo::remove_portlet
	    Clone dotlrn_random_photo::clone
	    ChangeEventHandler dotlrn_random_photo::change_event_handler
        }
    }
    
    acs_sc::impl::new_from_spec -spec $spec
}

ad_proc -private dotlrn_random_photo::unregister_portal_datasource_impl {} {
    Unregister service contract implementations
} {
    acs_sc::impl::delete \
        -contract_name "dotlrn_applet" \
        -impl_name "dotlrn_random_photo"
}
