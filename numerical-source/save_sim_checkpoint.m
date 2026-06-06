function save_sim_checkpoint(ckpt_file, ckpt)
%SAVE_SIM_CHECKPOINT Atomic checkpoint write with trimmed eclipse arrays.
ckpt_out = ckpt;
if ckpt.u > 1
    ckpt_out.SolarTime = ckpt.SolarTime(1:ckpt.u-1, :);
else
    ckpt_out.SolarTime = zeros(0, 2);
end
if ckpt.v > 1
    ckpt_out.LunarTime = ckpt.LunarTime(1:ckpt.v-1, :);
else
    ckpt_out.LunarTime = zeros(0, 2);
end
fprintf("v: %d, u: %d\n", ckpt.v, ckpt.u)
fprintf("m: %d\n", ckpt.m)
ckpt_out.s0 = ckpt_out.s0(1:72);
tmp = [ckpt_file '.tmp'];
save(tmp, 'ckpt', '-v6');
movefile(tmp, ckpt_file, 'f');
