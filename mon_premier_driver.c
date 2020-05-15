#include <linux/module.h>
#include <linux/init.h>

static int __init mon_premier_driver_init(void)
{
    printk(KERN_DEBUG "|| MON PREMIER DRIVER || Hello World !\n");
    return 0;
}

static void __exit mon_premier_driver_cleanup(void)
{
    printk(KERN_DEBUG "|| MON PREMIER DRIVER || Goodbye World!\n");
}

module_init(mon_premier_driver_init);
module_exit(mon_premier_driver_cleanup);
