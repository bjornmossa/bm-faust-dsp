declare name "prod 4";
declare version "0.1";
declare author "Bjornmossa";
declare license "GPL v3";
declare description "FM Ugen Mix of two groups of fm operators
where each group is a product of two operators";

import("../utils.lib");
import("stdfaust.lib");

num_groups = 2;
ops_in_group = 2;

main_freq = hslider("[0]freq", 20.0, 0.1, 20000, 0.1);

group = prod(i, ops_in_group, hgroup("operator %i", fm_op));
groups = par(i, num_groups, hgroup("group %i", group));

process = main_freq <: groups :> os.osc;
