#include <wayfire/plugin.hpp>

class ${TEMPLATE_PLUGIN_CLASS_NAME} : public wf::plugin_interface_t
{
  public:
    void init() override
    {
        /* Create plugin */
    }

    void fini() override
    {
        /* Destroy plugin */
    }
};

DECLARE_WAYFIRE_PLUGIN($TEMPLATE_PLUGIN_CLASS_NAME)
