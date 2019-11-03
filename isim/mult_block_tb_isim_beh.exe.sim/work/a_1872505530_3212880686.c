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

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/jeanw/Desktop/VHDL/vhdl_calculator/subtractor.vhd";
extern char *IEEE_P_3620187407;

char *ieee_p_3620187407_sub_767740470_3965413181(char *, char *, char *, char *, char *, char *);


static void work_a_1872505530_3212880686_p_0(char *t0)
{
    char t5[16];
    char t11[16];
    char *t1;
    char *t2;
    char *t3;
    char *t6;
    char *t7;
    int t8;
    unsigned int t9;
    unsigned char t10;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    unsigned int t17;
    unsigned char t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t26;
    char *t27;
    char *t28;
    char *t29;
    char *t30;
    char *t31;

LAB0:    xsi_set_current_line(17, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t1 = (t0 + 4584U);
    t3 = (t0 + 4648);
    t6 = (t5 + 0U);
    t7 = (t6 + 0U);
    *((int *)t7) = 0;
    t7 = (t6 + 4U);
    *((int *)t7) = 3;
    t7 = (t6 + 8U);
    *((int *)t7) = 1;
    t8 = (3 - 0);
    t9 = (t8 * 1);
    t9 = (t9 + 1);
    t7 = (t6 + 12U);
    *((unsigned int *)t7) = t9;
    t10 = ieee_std_logic_unsigned_greater_stdv_stdv(IEEE_P_3620187407, t2, t1, t3, t5);
    if (t10 != 0)
        goto LAB3;

LAB4:
LAB7:    t24 = (t0 + 4652);
    t26 = (t0 + 2912);
    t27 = (t26 + 56U);
    t28 = *((char **)t27);
    t29 = (t28 + 56U);
    t30 = *((char **)t29);
    memcpy(t30, t24, 4U);
    xsi_driver_first_trans_fast_port(t26);

LAB2:    t31 = (t0 + 2832);
    *((int *)t31) = 1;

LAB1:    return;
LAB3:    t7 = (t0 + 1032U);
    t12 = *((char **)t7);
    t7 = (t0 + 4584U);
    t13 = (t0 + 1192U);
    t14 = *((char **)t13);
    t13 = (t0 + 4600U);
    t15 = ieee_p_3620187407_sub_767740470_3965413181(IEEE_P_3620187407, t11, t12, t7, t14, t13);
    t16 = (t11 + 12U);
    t9 = *((unsigned int *)t16);
    t17 = (1U * t9);
    t18 = (4U != t17);
    if (t18 == 1)
        goto LAB5;

LAB6:    t19 = (t0 + 2912);
    t20 = (t19 + 56U);
    t21 = *((char **)t20);
    t22 = (t21 + 56U);
    t23 = *((char **)t22);
    memcpy(t23, t15, 4U);
    xsi_driver_first_trans_fast_port(t19);
    goto LAB2;

LAB5:    xsi_size_not_matching(4U, t17, 0);
    goto LAB6;

LAB8:    goto LAB2;

}


extern void work_a_1872505530_3212880686_init()
{
	static char *pe[] = {(void *)work_a_1872505530_3212880686_p_0};
	xsi_register_didat("work_a_1872505530_3212880686", "isim/mult_block_tb_isim_beh.exe.sim/work/a_1872505530_3212880686.didat");
	xsi_register_executes(pe);
}
