project(
	'wayfire-plugin-${TEMPLATE_PLUGIN_NAME}',
    'cpp',
	default_options: [
		'cpp_std=c++17',
		'warning_level=2',
	],
)

wayfire  = dependency('wayfire')
wlroots  = dependency('wlroots')
wfconfig = dependency('wf-config')

add_project_arguments(['-DWAYFIRE_PLUGIN', '-DWLR_USE_UNSTABLE'], language: 'cpp')
add_project_link_arguments(['-rdynamic'], language: 'cpp')

shadows = shared_module(
    '$TEMPLATE_PLUGIN_NAME', [
        '${TEMPLATE_PLUGIN_NAME}.cpp',
    ],

    dependencies: [
        wlroots,
        wfconfig,
        wayfire
    ],

    install: true,
    install_dir: join_paths( get_option( 'libdir' ), 'wayfire' )
)

install_data( '${TEMPLATE_PLUGIN_NAME}.xml', install_dir: wayfire.get_variable( pkgconfig: 'metadatadir' ) )
