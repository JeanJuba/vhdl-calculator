/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

#include "xsi.h"

struct XSI_INFO xsi_info;

char *IEEE_P_1242562249;
char *IEEE_P_3620187407;
char *STD_STANDARD;
char *IEEE_P_2592010699;
char *IEEE_P_3499444699;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    ieee_p_2592010699_init();
    work_a_3392787015_3212880686_init();
    work_a_3692318571_3212880686_init();
    work_a_2023191012_3212880686_init();
    work_a_2099420831_3212880686_init();
    work_a_3994985738_3212880686_init();
    ieee_p_3499444699_init();
    ieee_p_3620187407_init();
    ieee_p_1242562249_init();
    work_a_1153420228_3212880686_init();
    work_a_1872505530_3212880686_init();
    work_a_1715925260_3212880686_init();
    work_a_4167499274_3212880686_init();
    work_a_2690205293_3212880686_init();
    work_a_2088374658_3212880686_init();
    work_a_0457277141_3212880686_init();
    work_a_1305256040_3212880686_init();
    work_a_0290344353_3212880686_init();
    work_a_1280820523_3212880686_init();
    work_a_1475363046_3212880686_init();
    work_a_2598651374_3212880686_init();
    work_a_2696169242_3212880686_init();
    work_a_1228169037_3212880686_init();
    work_a_1393082307_3212880686_init();
    work_a_0862902424_3212880686_init();
    work_a_2655220167_2372691052_init();


    xsi_register_tops("work_a_2655220167_2372691052");

    IEEE_P_1242562249 = xsi_get_engine_memory("ieee_p_1242562249");
    IEEE_P_3620187407 = xsi_get_engine_memory("ieee_p_3620187407");
    STD_STANDARD = xsi_get_engine_memory("std_standard");
    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);
    IEEE_P_3499444699 = xsi_get_engine_memory("ieee_p_3499444699");

    return xsi_run_simulation(argc, argv);

}
