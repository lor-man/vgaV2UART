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

/* This file is designed for use with ISim build 0xfbc00daa */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "/home/ise/ise_vm/VGARAM/PE6/mux_wr.vhd";



static void work_a_2794713332_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t4;
    unsigned int t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    unsigned char t17;
    unsigned int t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;
    char *t29;
    char *t30;
    char *t31;
    char *t32;
    char *t33;
    char *t34;

LAB0:    xsi_set_current_line(17, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t1 = (t0 + 4697);
    t4 = 1;
    if (1U == 1U)
        goto LAB5;

LAB6:    t4 = 0;

LAB7:    if (t4 != 0)
        goto LAB3;

LAB4:    t14 = (t0 + 1032U);
    t15 = *((char **)t14);
    t14 = (t0 + 4698);
    t17 = 1;
    if (1U == 1U)
        goto LAB13;

LAB14:    t17 = 0;

LAB15:    if (t17 != 0)
        goto LAB11;

LAB12:
LAB19:    t27 = (t0 + 4699);
    t29 = (t0 + 3064);
    t30 = (t29 + 56U);
    t31 = *((char **)t30);
    t32 = (t31 + 56U);
    t33 = *((char **)t32);
    memcpy(t33, t27, 12U);
    xsi_driver_first_trans_fast_port(t29);

LAB2:    t34 = (t0 + 2984);
    *((int *)t34) = 1;

LAB1:    return;
LAB3:    t8 = (t0 + 1192U);
    t9 = *((char **)t8);
    t8 = (t0 + 3064);
    t10 = (t8 + 56U);
    t11 = *((char **)t10);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t9, 12U);
    xsi_driver_first_trans_fast_port(t8);
    goto LAB2;

LAB5:    t5 = 0;

LAB8:    if (t5 < 1U)
        goto LAB9;
    else
        goto LAB7;

LAB9:    t6 = (t2 + t5);
    t7 = (t1 + t5);
    if (*((unsigned char *)t6) != *((unsigned char *)t7))
        goto LAB6;

LAB10:    t5 = (t5 + 1);
    goto LAB8;

LAB11:    t21 = (t0 + 1352U);
    t22 = *((char **)t21);
    t21 = (t0 + 3064);
    t23 = (t21 + 56U);
    t24 = *((char **)t23);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    memcpy(t26, t22, 12U);
    xsi_driver_first_trans_fast_port(t21);
    goto LAB2;

LAB13:    t18 = 0;

LAB16:    if (t18 < 1U)
        goto LAB17;
    else
        goto LAB15;

LAB17:    t19 = (t15 + t18);
    t20 = (t14 + t18);
    if (*((unsigned char *)t19) != *((unsigned char *)t20))
        goto LAB14;

LAB18:    t18 = (t18 + 1);
    goto LAB16;

LAB20:    goto LAB2;

}


extern void work_a_2794713332_3212880686_init()
{
	static char *pe[] = {(void *)work_a_2794713332_3212880686_p_0};
	xsi_register_didat("work_a_2794713332_3212880686", "isim/general_prueba_isim_beh.exe.sim/work/a_2794713332_3212880686.didat");
	xsi_register_executes(pe);
}
