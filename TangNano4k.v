module HVSync(
  input         clock,
  input         reset,
  output        io_hsync,
  output        io_vsync,
  output        io_display_on,
  output [10:0] io_hpos
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  wire [10:0] H_SYNC_END = 11'h596 - 11'h1; // @[hvsync.scala 48:51]
  wire [10:0] H_MAX = 11'h672 - 11'h1; // @[hvsync.scala 49:60]
  wire [9:0] V_SYNC_END = 10'h2e9 - 10'h1; // @[hvsync.scala 51:52]
  wire [9:0] V_MAX = 10'h2ee - 10'h1; // @[hvsync.scala 52:60]
  reg [10:0] hpos_count; // @[hvsync.scala 59:27]
  reg [9:0] vpos_count; // @[hvsync.scala 60:27]
  wire  _io_hsync_T_1 = hpos_count <= H_SYNC_END; // @[hvsync.scala 68:29]
  wire  hpos_max = hpos_count == H_MAX; // @[hvsync.scala 70:29]
  wire  vpos_max = vpos_count == V_MAX; // @[hvsync.scala 71:29]
  wire [10:0] _hpos_count_T_1 = hpos_count + 11'h1; // @[hvsync.scala 73:28]
  wire  _io_vsync_T_1 = vpos_count <= V_SYNC_END; // @[hvsync.scala 80:27]
  wire [9:0] _vpos_count_T_1 = vpos_count + 10'h1; // @[hvsync.scala 82:30]
  assign io_hsync = ~(hpos_count >= 11'h56e & _io_hsync_T_1); // @[hvsync.scala 67:15]
  assign io_vsync = ~(vpos_count >= 10'h2e4 & _io_vsync_T_1); // @[hvsync.scala 79:15]
  assign io_display_on = hpos_count < 11'h500 & vpos_count < 10'h2d0; // @[hvsync.scala 64:45]
  assign io_hpos = hpos_count; // @[hvsync.scala 62:11]
  always @(posedge clock) begin
    if (reset) begin // @[hvsync.scala 59:27]
      hpos_count <= 11'h0; // @[hvsync.scala 59:27]
    end else if (hpos_max) begin // @[hvsync.scala 74:17]
      hpos_count <= 11'h0; // @[hvsync.scala 75:16]
    end else begin
      hpos_count <= _hpos_count_T_1; // @[hvsync.scala 73:14]
    end
    if (reset) begin // @[hvsync.scala 60:27]
      vpos_count <= 10'h0; // @[hvsync.scala 60:27]
    end else if (hpos_max) begin // @[hvsync.scala 81:18]
      if (vpos_max) begin // @[hvsync.scala 83:20]
        vpos_count <= 10'h0; // @[hvsync.scala 84:18]
      end else begin
        vpos_count <= _vpos_count_T_1; // @[hvsync.scala 82:16]
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  hpos_count = _RAND_0[10:0];
  _RAND_1 = {1{`RANDOM}};
  vpos_count = _RAND_1[9:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module TMDSEncoder(
  input        clock,
  input        reset,
  input        io_en,
  input  [1:0] io_ctrl,
  input  [7:0] io_din,
  output [9:0] io_dout
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  wire [1:0] _n_one_din_T_8 = io_din[0] + io_din[1]; // @[Bitwise.scala 48:55]
  wire [1:0] _n_one_din_T_10 = io_din[2] + io_din[3]; // @[Bitwise.scala 48:55]
  wire [2:0] _n_one_din_T_12 = _n_one_din_T_8 + _n_one_din_T_10; // @[Bitwise.scala 48:55]
  wire [1:0] _n_one_din_T_14 = io_din[4] + io_din[5]; // @[Bitwise.scala 48:55]
  wire [1:0] _n_one_din_T_16 = io_din[6] + io_din[7]; // @[Bitwise.scala 48:55]
  wire [2:0] _n_one_din_T_18 = _n_one_din_T_14 + _n_one_din_T_16; // @[Bitwise.scala 48:55]
  wire [3:0] n_one_din = _n_one_din_T_12 + _n_one_din_T_18; // @[Bitwise.scala 48:55]
  wire  xored_res_1 = io_din[0] ^ io_din[1]; // @[TmdsEncoder.scala 23:26]
  wire  xored_res_2 = xored_res_1 ^ io_din[2]; // @[TmdsEncoder.scala 23:26]
  wire  xored_res_3 = xored_res_2 ^ io_din[3]; // @[TmdsEncoder.scala 23:26]
  wire  xored_res_4 = xored_res_3 ^ io_din[4]; // @[TmdsEncoder.scala 23:26]
  wire  xored_res_5 = xored_res_4 ^ io_din[5]; // @[TmdsEncoder.scala 23:26]
  wire  xored_res_6 = xored_res_5 ^ io_din[6]; // @[TmdsEncoder.scala 23:26]
  wire  xored_res_7 = xored_res_6 ^ io_din[7]; // @[TmdsEncoder.scala 23:26]
  wire [8:0] xored = {1'h1,xored_res_7,xored_res_6,xored_res_5,xored_res_4,xored_res_3,xored_res_2,xored_res_1,io_din[0]
    }; // @[TmdsEncoder.scala 26:9]
  wire  xnored_res_1 = ~xored_res_1; // @[TmdsEncoder.scala 36:17]
  wire  xnored_res_2 = ~(xnored_res_1 ^ io_din[2]); // @[TmdsEncoder.scala 36:17]
  wire  xnored_res_3 = ~(xnored_res_2 ^ io_din[3]); // @[TmdsEncoder.scala 36:17]
  wire  xnored_res_4 = ~(xnored_res_3 ^ io_din[4]); // @[TmdsEncoder.scala 36:17]
  wire  xnored_res_5 = ~(xnored_res_4 ^ io_din[5]); // @[TmdsEncoder.scala 36:17]
  wire  xnored_res_6 = ~(xnored_res_5 ^ io_din[6]); // @[TmdsEncoder.scala 36:17]
  wire  xnored_res_7 = ~(xnored_res_6 ^ io_din[7]); // @[TmdsEncoder.scala 36:17]
  wire [8:0] xnored = {1'h0,xnored_res_7,xnored_res_6,xnored_res_5,xnored_res_4,xnored_res_3,xnored_res_2,xnored_res_1,
    io_din[0]}; // @[TmdsEncoder.scala 39:9]
  wire  _q_m_T_5 = n_one_din > 4'h4 | n_one_din == 4'h4 & ~io_din[0]; // @[TmdsEncoder.scala 46:23]
  wire [8:0] q_m = _q_m_T_5 ? xnored : xored; // @[TmdsEncoder.scala 45:16]
  reg [3:0] diff; // @[TmdsEncoder.scala 51:21]
  wire [1:0] _diff_T_9 = q_m[0] + q_m[1]; // @[Bitwise.scala 48:55]
  wire [1:0] _diff_T_11 = q_m[2] + q_m[3]; // @[Bitwise.scala 48:55]
  wire [2:0] _diff_T_13 = _diff_T_9 + _diff_T_11; // @[Bitwise.scala 48:55]
  wire [1:0] _diff_T_15 = q_m[4] + q_m[5]; // @[Bitwise.scala 48:55]
  wire [1:0] _diff_T_17 = q_m[7] + q_m[8]; // @[Bitwise.scala 48:55]
  wire [1:0] _GEN_13 = {{1'd0}, q_m[6]}; // @[Bitwise.scala 48:55]
  wire [2:0] _diff_T_19 = _GEN_13 + _diff_T_17; // @[Bitwise.scala 48:55]
  wire [2:0] _diff_T_21 = _diff_T_15 + _diff_T_19[1:0]; // @[Bitwise.scala 48:55]
  wire [3:0] _diff_T_25 = _diff_T_13 + _diff_T_21; // @[TmdsEncoder.scala 52:25]
  wire [3:0] _diff_T_28 = $signed(_diff_T_25) - 4'sh4; // @[TmdsEncoder.scala 52:32]
  reg [3:0] disparityReg; // @[TmdsEncoder.scala 56:29]
  reg [9:0] doutReg; // @[TmdsEncoder.scala 57:24]
  wire [9:0] _GEN_0 = 2'h2 == io_ctrl ? 10'h154 : 10'h2ab; // @[TmdsEncoder.scala 60:13 61:20 64:34]
  wire [7:0] _doutReg_T_1 = ~q_m[7:0]; // @[TmdsEncoder.scala 70:36]
  wire [9:0] _doutReg_T_2 = {2'h2,_doutReg_T_1}; // @[TmdsEncoder.scala 70:33]
  wire [3:0] _disparityReg_T_2 = $signed(disparityReg) - $signed(diff); // @[TmdsEncoder.scala 71:38]
  wire [9:0] _doutReg_T_4 = {2'h1,q_m[7:0]}; // @[TmdsEncoder.scala 73:33]
  wire [3:0] _disparityReg_T_5 = $signed(disparityReg) + $signed(diff); // @[TmdsEncoder.scala 74:38]
  wire  _T_13 = ~diff[3] & ~disparityReg[3]; // @[TmdsEncoder.scala 76:36]
  wire [9:0] _doutReg_T_9 = {1'h1,q_m[8],_doutReg_T_1}; // @[TmdsEncoder.scala 78:37]
  wire [3:0] _disparityReg_T_8 = $signed(disparityReg) + 4'sh1; // @[TmdsEncoder.scala 80:38]
  wire [3:0] _disparityReg_T_11 = $signed(_disparityReg_T_8) - $signed(diff); // @[TmdsEncoder.scala 80:44]
  wire [3:0] _GEN_5 = q_m[8] ? $signed(_disparityReg_T_11) : $signed(_disparityReg_T_2); // @[TmdsEncoder.scala 79:19 80:22 82:22]
  wire [9:0] _doutReg_T_10 = {1'h0,q_m}; // @[TmdsEncoder.scala 85:27]
  wire [3:0] _disparityReg_T_20 = $signed(disparityReg) - 4'sh1; // @[TmdsEncoder.scala 89:38]
  wire [3:0] _disparityReg_T_23 = $signed(_disparityReg_T_20) + $signed(diff); // @[TmdsEncoder.scala 89:44]
  wire [3:0] _GEN_6 = q_m[8] ? $signed(_disparityReg_T_5) : $signed(_disparityReg_T_23); // @[TmdsEncoder.scala 86:19 87:22 89:22]
  assign io_dout = doutReg; // @[TmdsEncoder.scala 93:11]
  always @(posedge clock) begin
    if (reset) begin // @[TmdsEncoder.scala 51:21]
      diff <= 4'sh0; // @[TmdsEncoder.scala 51:21]
    end else begin
      diff <= _diff_T_28; // @[TmdsEncoder.scala 52:8]
    end
    if (reset) begin // @[TmdsEncoder.scala 56:29]
      disparityReg <= 4'sh0; // @[TmdsEncoder.scala 56:29]
    end else if (~io_en) begin // @[TmdsEncoder.scala 58:26]
      disparityReg <= 4'sh0; // @[TmdsEncoder.scala 59:18]
    end else if ($signed(disparityReg) == 4'sh0 | $signed(diff) == 4'sh0) begin // @[TmdsEncoder.scala 67:47]
      if (~q_m[8]) begin // @[TmdsEncoder.scala 69:31]
        disparityReg <= _disparityReg_T_2; // @[TmdsEncoder.scala 71:22]
      end else begin
        disparityReg <= _disparityReg_T_5; // @[TmdsEncoder.scala 74:22]
      end
    end else if (_T_13 | diff[3] & disparityReg[3]) begin // @[TmdsEncoder.scala 77:72]
      disparityReg <= _GEN_5;
    end else begin
      disparityReg <= _GEN_6;
    end
    if (reset) begin // @[TmdsEncoder.scala 57:24]
      doutReg <= 10'h2ab; // @[TmdsEncoder.scala 57:24]
    end else if (~io_en) begin // @[TmdsEncoder.scala 58:26]
      if (2'h0 == io_ctrl) begin // @[TmdsEncoder.scala 61:20]
        doutReg <= 10'h354; // @[TmdsEncoder.scala 62:34]
      end else if (2'h1 == io_ctrl) begin // @[TmdsEncoder.scala 61:20]
        doutReg <= 10'hab; // @[TmdsEncoder.scala 63:34]
      end else begin
        doutReg <= _GEN_0;
      end
    end else if ($signed(disparityReg) == 4'sh0 | $signed(diff) == 4'sh0) begin // @[TmdsEncoder.scala 67:47]
      if (~q_m[8]) begin // @[TmdsEncoder.scala 69:31]
        doutReg <= _doutReg_T_2; // @[TmdsEncoder.scala 70:17]
      end else begin
        doutReg <= _doutReg_T_4; // @[TmdsEncoder.scala 73:17]
      end
    end else if (_T_13 | diff[3] & disparityReg[3]) begin // @[TmdsEncoder.scala 77:72]
      doutReg <= _doutReg_T_9; // @[TmdsEncoder.scala 78:15]
    end else begin
      doutReg <= _doutReg_T_10; // @[TmdsEncoder.scala 85:15]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  diff = _RAND_0[3:0];
  _RAND_1 = {1{`RANDOM}};
  disparityReg = _RAND_1[3:0];
  _RAND_2 = {1{`RANDOM}};
  doutReg = _RAND_2[9:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Rgb2Tmds(
  input        clock,
  input        reset,
  input  [7:0] io_videoSig_pixel_red,
  input  [7:0] io_videoSig_pixel_green,
  input  [7:0] io_videoSig_pixel_blue,
  input        io_videoSig_de,
  input        io_videoSig_hsync,
  input        io_videoSig_vsync,
  output [9:0] io_tmds_blue,
  output [9:0] io_tmds_red,
  output [9:0] io_tmds_green
);
  wire  tbM_clock; // @[Rgb2Tmds.scala 16:19]
  wire  tbM_reset; // @[Rgb2Tmds.scala 16:19]
  wire  tbM_io_en; // @[Rgb2Tmds.scala 16:19]
  wire [1:0] tbM_io_ctrl; // @[Rgb2Tmds.scala 16:19]
  wire [7:0] tbM_io_din; // @[Rgb2Tmds.scala 16:19]
  wire [9:0] tbM_io_dout; // @[Rgb2Tmds.scala 16:19]
  wire  trM_clock; // @[Rgb2Tmds.scala 23:19]
  wire  trM_reset; // @[Rgb2Tmds.scala 23:19]
  wire  trM_io_en; // @[Rgb2Tmds.scala 23:19]
  wire [1:0] trM_io_ctrl; // @[Rgb2Tmds.scala 23:19]
  wire [7:0] trM_io_din; // @[Rgb2Tmds.scala 23:19]
  wire [9:0] trM_io_dout; // @[Rgb2Tmds.scala 23:19]
  wire  tgM_clock; // @[Rgb2Tmds.scala 30:19]
  wire  tgM_reset; // @[Rgb2Tmds.scala 30:19]
  wire  tgM_io_en; // @[Rgb2Tmds.scala 30:19]
  wire [1:0] tgM_io_ctrl; // @[Rgb2Tmds.scala 30:19]
  wire [7:0] tgM_io_din; // @[Rgb2Tmds.scala 30:19]
  wire [9:0] tgM_io_dout; // @[Rgb2Tmds.scala 30:19]
  TMDSEncoder tbM ( // @[Rgb2Tmds.scala 16:19]
    .clock(tbM_clock),
    .reset(tbM_reset),
    .io_en(tbM_io_en),
    .io_ctrl(tbM_io_ctrl),
    .io_din(tbM_io_din),
    .io_dout(tbM_io_dout)
  );
  TMDSEncoder trM ( // @[Rgb2Tmds.scala 23:19]
    .clock(trM_clock),
    .reset(trM_reset),
    .io_en(trM_io_en),
    .io_ctrl(trM_io_ctrl),
    .io_din(trM_io_din),
    .io_dout(trM_io_dout)
  );
  TMDSEncoder tgM ( // @[Rgb2Tmds.scala 30:19]
    .clock(tgM_clock),
    .reset(tgM_reset),
    .io_en(tgM_io_en),
    .io_ctrl(tgM_io_ctrl),
    .io_din(tgM_io_din),
    .io_dout(tgM_io_dout)
  );
  assign io_tmds_blue = tbM_io_dout; // @[Rgb2Tmds.scala 20:16]
  assign io_tmds_red = trM_io_dout; // @[Rgb2Tmds.scala 27:15]
  assign io_tmds_green = tgM_io_dout; // @[Rgb2Tmds.scala 34:17]
  assign tbM_clock = clock;
  assign tbM_reset = reset;
  assign tbM_io_en = io_videoSig_de; // @[Rgb2Tmds.scala 17:13]
  assign tbM_io_ctrl = {io_videoSig_vsync,io_videoSig_hsync}; // @[Rgb2Tmds.scala 18:36]
  assign tbM_io_din = io_videoSig_pixel_blue; // @[Rgb2Tmds.scala 19:14]
  assign trM_clock = clock;
  assign trM_reset = reset;
  assign trM_io_en = io_videoSig_de; // @[Rgb2Tmds.scala 24:13]
  assign trM_io_ctrl = 2'h0; // @[Rgb2Tmds.scala 25:15]
  assign trM_io_din = io_videoSig_pixel_red; // @[Rgb2Tmds.scala 26:14]
  assign tgM_clock = clock;
  assign tgM_reset = reset;
  assign tgM_io_en = io_videoSig_de; // @[Rgb2Tmds.scala 31:13]
  assign tgM_io_ctrl = 2'h0; // @[Rgb2Tmds.scala 32:15]
  assign tgM_io_din = io_videoSig_pixel_green; // @[Rgb2Tmds.scala 33:14]
endmodule
module Oser10Module(
  input        clock,
  input        reset,
  output       io_q,
  input  [9:0] io_data,
  input        io_fclk
);
  wire  osr10_Q; // @[littlebee.scala 57:21]
  wire  osr10_D0; // @[littlebee.scala 57:21]
  wire  osr10_D1; // @[littlebee.scala 57:21]
  wire  osr10_D2; // @[littlebee.scala 57:21]
  wire  osr10_D3; // @[littlebee.scala 57:21]
  wire  osr10_D4; // @[littlebee.scala 57:21]
  wire  osr10_D5; // @[littlebee.scala 57:21]
  wire  osr10_D6; // @[littlebee.scala 57:21]
  wire  osr10_D7; // @[littlebee.scala 57:21]
  wire  osr10_D8; // @[littlebee.scala 57:21]
  wire  osr10_D9; // @[littlebee.scala 57:21]
  wire  osr10_PCLK; // @[littlebee.scala 57:21]
  wire  osr10_FCLK; // @[littlebee.scala 57:21]
  wire  osr10_RESET; // @[littlebee.scala 57:21]
  OSER10 #(.GSREN("false"), .LSREN("true")) osr10 ( // @[littlebee.scala 57:21]
    .Q(osr10_Q),
    .D0(osr10_D0),
    .D1(osr10_D1),
    .D2(osr10_D2),
    .D3(osr10_D3),
    .D4(osr10_D4),
    .D5(osr10_D5),
    .D6(osr10_D6),
    .D7(osr10_D7),
    .D8(osr10_D8),
    .D9(osr10_D9),
    .PCLK(osr10_PCLK),
    .FCLK(osr10_FCLK),
    .RESET(osr10_RESET)
  );
  assign io_q = osr10_Q; // @[littlebee.scala 58:8]
  assign osr10_D0 = io_data[0]; // @[littlebee.scala 59:25]
  assign osr10_D1 = io_data[1]; // @[littlebee.scala 60:25]
  assign osr10_D2 = io_data[2]; // @[littlebee.scala 61:25]
  assign osr10_D3 = io_data[3]; // @[littlebee.scala 62:25]
  assign osr10_D4 = io_data[4]; // @[littlebee.scala 63:25]
  assign osr10_D5 = io_data[5]; // @[littlebee.scala 64:25]
  assign osr10_D6 = io_data[6]; // @[littlebee.scala 65:25]
  assign osr10_D7 = io_data[7]; // @[littlebee.scala 66:25]
  assign osr10_D8 = io_data[8]; // @[littlebee.scala 67:25]
  assign osr10_D9 = io_data[9]; // @[littlebee.scala 68:25]
  assign osr10_PCLK = clock; // @[littlebee.scala 69:17]
  assign osr10_FCLK = io_fclk; // @[littlebee.scala 70:17]
  assign osr10_RESET = reset; // @[littlebee.scala 71:17]
endmodule
module PatternExample(
  input        clock,
  input        reset,
  input        io_serClk,
  output       io_tmds_clk,
  output [2:0] io_tmds_data
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire  hv_sync_clock; // @[PatternExample.scala 30:23]
  wire  hv_sync_reset; // @[PatternExample.scala 30:23]
  wire  hv_sync_io_hsync; // @[PatternExample.scala 30:23]
  wire  hv_sync_io_vsync; // @[PatternExample.scala 30:23]
  wire  hv_sync_io_display_on; // @[PatternExample.scala 30:23]
  wire [10:0] hv_sync_io_hpos; // @[PatternExample.scala 30:23]
  wire  rgb2tmds_clock; // @[PatternExample.scala 99:24]
  wire  rgb2tmds_reset; // @[PatternExample.scala 99:24]
  wire [7:0] rgb2tmds_io_videoSig_pixel_red; // @[PatternExample.scala 99:24]
  wire [7:0] rgb2tmds_io_videoSig_pixel_green; // @[PatternExample.scala 99:24]
  wire [7:0] rgb2tmds_io_videoSig_pixel_blue; // @[PatternExample.scala 99:24]
  wire  rgb2tmds_io_videoSig_de; // @[PatternExample.scala 99:24]
  wire  rgb2tmds_io_videoSig_hsync; // @[PatternExample.scala 99:24]
  wire  rgb2tmds_io_videoSig_vsync; // @[PatternExample.scala 99:24]
  wire [9:0] rgb2tmds_io_tmds_blue; // @[PatternExample.scala 99:24]
  wire [9:0] rgb2tmds_io_tmds_red; // @[PatternExample.scala 99:24]
  wire [9:0] rgb2tmds_io_tmds_green; // @[PatternExample.scala 99:24]
  wire  serdesBlue_clock; // @[PatternExample.scala 109:26]
  wire  serdesBlue_reset; // @[PatternExample.scala 109:26]
  wire  serdesBlue_io_q; // @[PatternExample.scala 109:26]
  wire [9:0] serdesBlue_io_data; // @[PatternExample.scala 109:26]
  wire  serdesBlue_io_fclk; // @[PatternExample.scala 109:26]
  wire  serdesGreen_clock; // @[PatternExample.scala 114:27]
  wire  serdesGreen_reset; // @[PatternExample.scala 114:27]
  wire  serdesGreen_io_q; // @[PatternExample.scala 114:27]
  wire [9:0] serdesGreen_io_data; // @[PatternExample.scala 114:27]
  wire  serdesGreen_io_fclk; // @[PatternExample.scala 114:27]
  wire  serdesRed_clock; // @[PatternExample.scala 119:25]
  wire  serdesRed_reset; // @[PatternExample.scala 119:25]
  wire  serdesRed_io_q; // @[PatternExample.scala 119:25]
  wire [9:0] serdesRed_io_data; // @[PatternExample.scala 119:25]
  wire  serdesRed_io_fclk; // @[PatternExample.scala 119:25]
  wire  serdesClk_clock; // @[PatternExample.scala 126:25]
  wire  serdesClk_reset; // @[PatternExample.scala 126:25]
  wire  serdesClk_io_q; // @[PatternExample.scala 126:25]
  wire [9:0] serdesClk_io_data; // @[PatternExample.scala 126:25]
  wire  serdesClk_io_fclk; // @[PatternExample.scala 126:25]
  wire [21:0] _x_T = hv_sync_io_hpos * 11'h5fa; // @[PatternExample.scala 47:26]
  reg [21:0] x; // @[PatternExample.scala 47:20]
  wire  _T = x < 22'hff; // @[PatternExample.scala 48:12]
  wire  _T_1 = x < 22'h1fe; // @[PatternExample.scala 50:18]
  wire [21:0] _pred_T_1 = 22'h1fe - x; // @[PatternExample.scala 51:22]
  wire  _T_2 = x < 22'h3fc; // @[PatternExample.scala 52:18]
  wire  _T_3 = x < 22'h4fb; // @[PatternExample.scala 54:18]
  wire [21:0] _pred_T_3 = x - 22'h3fc; // @[PatternExample.scala 55:17]
  wire [21:0] _GEN_0 = x < 22'h4fb ? _pred_T_3 : 22'hff; // @[PatternExample.scala 54:27 55:12 57:12]
  wire [21:0] _GEN_1 = x < 22'h3fc ? 22'h0 : _GEN_0; // @[PatternExample.scala 52:27 53:12]
  wire [21:0] _GEN_2 = x < 22'h1fe ? _pred_T_1 : _GEN_1; // @[PatternExample.scala 50:28 51:12]
  wire [21:0] _GEN_3 = x < 22'hff ? 22'hff : _GEN_2; // @[PatternExample.scala 48:21 49:12]
  wire  _T_5 = x < 22'h2fd; // @[PatternExample.scala 61:18]
  wire [21:0] _pgreen_T_1 = 22'h3fc - x; // @[PatternExample.scala 64:24]
  wire [21:0] _GEN_4 = _T_2 ? _pgreen_T_1 : 22'h0; // @[PatternExample.scala 63:27 64:14 66:14]
  wire [21:0] _GEN_5 = x < 22'h2fd ? 22'hff : _GEN_4; // @[PatternExample.scala 61:27 62:14]
  wire [21:0] _GEN_6 = _T ? x : _GEN_5; // @[PatternExample.scala 59:21 60:14]
  wire [21:0] _pblue_T_1 = x - 22'h1fe; // @[PatternExample.scala 72:18]
  wire [21:0] _pblue_T_3 = 22'h5fa - x; // @[PatternExample.scala 76:23]
  wire [21:0] _GEN_7 = x < 22'h5fa ? _pblue_T_3 : 22'h0; // @[PatternExample.scala 75:27 76:13 78:13]
  wire [21:0] _GEN_8 = _T_3 ? 22'hff : _GEN_7; // @[PatternExample.scala 73:27 74:13]
  wire [21:0] _GEN_9 = _T_5 ? _pblue_T_1 : _GEN_8; // @[PatternExample.scala 71:27 72:13]
  wire [21:0] _GEN_10 = _T_1 ? 22'h0 : _GEN_9; // @[PatternExample.scala 69:21 70:13]
  wire [7:0] pred = _GEN_3[7:0]; // @[PatternExample.scala 34:18]
  wire [7:0] pgreen = _GEN_6[7:0]; // @[PatternExample.scala 35:20]
  wire [7:0] pblue = _GEN_10[7:0]; // @[PatternExample.scala 33:20]
  wire [1:0] _io_tmds_data_T = {serdesRed_io_q,serdesGreen_io_q}; // @[PatternExample.scala 123:34]
  HVSync hv_sync ( // @[PatternExample.scala 30:23]
    .clock(hv_sync_clock),
    .reset(hv_sync_reset),
    .io_hsync(hv_sync_io_hsync),
    .io_vsync(hv_sync_io_vsync),
    .io_display_on(hv_sync_io_display_on),
    .io_hpos(hv_sync_io_hpos)
  );
  Rgb2Tmds rgb2tmds ( // @[PatternExample.scala 99:24]
    .clock(rgb2tmds_clock),
    .reset(rgb2tmds_reset),
    .io_videoSig_pixel_red(rgb2tmds_io_videoSig_pixel_red),
    .io_videoSig_pixel_green(rgb2tmds_io_videoSig_pixel_green),
    .io_videoSig_pixel_blue(rgb2tmds_io_videoSig_pixel_blue),
    .io_videoSig_de(rgb2tmds_io_videoSig_de),
    .io_videoSig_hsync(rgb2tmds_io_videoSig_hsync),
    .io_videoSig_vsync(rgb2tmds_io_videoSig_vsync),
    .io_tmds_blue(rgb2tmds_io_tmds_blue),
    .io_tmds_red(rgb2tmds_io_tmds_red),
    .io_tmds_green(rgb2tmds_io_tmds_green)
  );
  Oser10Module serdesBlue ( // @[PatternExample.scala 109:26]
    .clock(serdesBlue_clock),
    .reset(serdesBlue_reset),
    .io_q(serdesBlue_io_q),
    .io_data(serdesBlue_io_data),
    .io_fclk(serdesBlue_io_fclk)
  );
  Oser10Module serdesGreen ( // @[PatternExample.scala 114:27]
    .clock(serdesGreen_clock),
    .reset(serdesGreen_reset),
    .io_q(serdesGreen_io_q),
    .io_data(serdesGreen_io_data),
    .io_fclk(serdesGreen_io_fclk)
  );
  Oser10Module serdesRed ( // @[PatternExample.scala 119:25]
    .clock(serdesRed_clock),
    .reset(serdesRed_reset),
    .io_q(serdesRed_io_q),
    .io_data(serdesRed_io_data),
    .io_fclk(serdesRed_io_fclk)
  );
  Oser10Module serdesClk ( // @[PatternExample.scala 126:25]
    .clock(serdesClk_clock),
    .reset(serdesClk_reset),
    .io_q(serdesClk_io_q),
    .io_data(serdesClk_io_data),
    .io_fclk(serdesClk_io_fclk)
  );
  assign io_tmds_clk = serdesClk_io_q; // @[PatternExample.scala 129:15]
  assign io_tmds_data = {_io_tmds_data_T,serdesBlue_io_q}; // @[PatternExample.scala 123:54]
  assign hv_sync_clock = clock;
  assign hv_sync_reset = reset;
  assign rgb2tmds_clock = clock;
  assign rgb2tmds_reset = reset;
  assign rgb2tmds_io_videoSig_pixel_red = hv_sync_io_display_on ? pred : 8'h0; // @[PatternExample.scala 103:42]
  assign rgb2tmds_io_videoSig_pixel_green = hv_sync_io_display_on ? pgreen : 8'h0; // @[PatternExample.scala 104:42]
  assign rgb2tmds_io_videoSig_pixel_blue = hv_sync_io_display_on ? pblue : 8'h0; // @[PatternExample.scala 105:42]
  assign rgb2tmds_io_videoSig_de = hv_sync_io_display_on; // @[PatternExample.scala 100:27]
  assign rgb2tmds_io_videoSig_hsync = hv_sync_io_hsync; // @[PatternExample.scala 101:30]
  assign rgb2tmds_io_videoSig_vsync = hv_sync_io_vsync; // @[PatternExample.scala 102:30]
  assign serdesBlue_clock = clock;
  assign serdesBlue_reset = reset;
  assign serdesBlue_io_data = rgb2tmds_io_tmds_blue; // @[PatternExample.scala 110:22]
  assign serdesBlue_io_fclk = io_serClk; // @[PatternExample.scala 111:22]
  assign serdesGreen_clock = clock;
  assign serdesGreen_reset = reset;
  assign serdesGreen_io_data = rgb2tmds_io_tmds_green; // @[PatternExample.scala 115:23]
  assign serdesGreen_io_fclk = io_serClk; // @[PatternExample.scala 116:23]
  assign serdesRed_clock = clock;
  assign serdesRed_reset = reset;
  assign serdesRed_io_data = rgb2tmds_io_tmds_red; // @[PatternExample.scala 120:21]
  assign serdesRed_io_fclk = io_serClk; // @[PatternExample.scala 121:21]
  assign serdesClk_clock = clock;
  assign serdesClk_reset = reset;
  assign serdesClk_io_data = 10'h3e0; // @[PatternExample.scala 127:21]
  assign serdesClk_io_fclk = io_serClk; // @[PatternExample.scala 128:21]
  always @(posedge clock) begin
    x <= _x_T / 11'h500; // @[PatternExample.scala 47:34]
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  x = _RAND_0[21:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module TangNano4k(
  input        I_clk,
  input        I_reset_n,
  output [1:0] O_led,
  output       O_tmds_clk_p,
  output       O_tmds_clk_n,
  output       O_tmds_data_0_p,
  output       O_tmds_data_0_n,
  output       O_tmds_data_1_p,
  output       O_tmds_data_1_n,
  output       O_tmds_data_2_p,
  output       O_tmds_data_2_n,
  input        I_button,
  output       O_trig
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire  clkDiv_RESETN; // @[tangnano4k.scala 56:24]
  wire  clkDiv_HCLKIN; // @[tangnano4k.scala 56:24]
  wire  clkDiv_CLKOUT; // @[tangnano4k.scala 56:24]
  wire  clkDiv_CALIB; // @[tangnano4k.scala 56:24]
  wire  tmdsPllvr_clkin; // @[tangnano4k.scala 63:27]
  wire  tmdsPllvr_clkout; // @[tangnano4k.scala 63:27]
  wire  tmdsPllvr_clkoutd; // @[tangnano4k.scala 63:27]
  wire  tmdsPllvr_lock; // @[tangnano4k.scala 63:27]
  wire  patternExample_clock; // @[tangnano4k.scala 75:34]
  wire  patternExample_reset; // @[tangnano4k.scala 75:34]
  wire  patternExample_io_serClk; // @[tangnano4k.scala 75:34]
  wire  patternExample_io_tmds_clk; // @[tangnano4k.scala 75:34]
  wire [2:0] patternExample_io_tmds_data; // @[tangnano4k.scala 75:34]
  wire  buffDiffBlue_O; // @[tangnano4k.scala 79:32]
  wire  buffDiffBlue_OB; // @[tangnano4k.scala 79:32]
  wire  buffDiffBlue_I; // @[tangnano4k.scala 79:32]
  wire  buffDiffGreen_O; // @[tangnano4k.scala 81:33]
  wire  buffDiffGreen_OB; // @[tangnano4k.scala 81:33]
  wire  buffDiffGreen_I; // @[tangnano4k.scala 81:33]
  wire  buffDiffRed_O; // @[tangnano4k.scala 83:31]
  wire  buffDiffRed_OB; // @[tangnano4k.scala 83:31]
  wire  buffDiffRed_I; // @[tangnano4k.scala 83:31]
  wire  buffDiffClk_O; // @[tangnano4k.scala 85:31]
  wire  buffDiffClk_OB; // @[tangnano4k.scala 85:31]
  wire  buffDiffClk_I; // @[tangnano4k.scala 85:31]
  wire  pll_lock = tmdsPllvr_lock; // @[tangnano4k.scala 49:25 66:14]
  wire  glb_rst = ~(pll_lock & I_reset_n); // @[tangnano4k.scala 53:19]
  wire  pix_clk = clkDiv_CLKOUT; // @[tangnano4k.scala 51:23 59:13]
  reg [24:0] counterReg; // @[Counter.scala 62:40]
  wire  wrap_wrap = counterReg == 25'h19bfcbf; // @[Counter.scala 74:24]
  wire [24:0] _wrap_value_T_1 = counterReg + 25'h1; // @[Counter.scala 78:24]
  CLKDIV #(.DIV_MODE("5")) clkDiv ( // @[tangnano4k.scala 56:24]
    .RESETN(clkDiv_RESETN),
    .HCLKIN(clkDiv_HCLKIN),
    .CLKOUT(clkDiv_CLKOUT),
    .CALIB(clkDiv_CALIB)
  );
  TMDS_PLLVR tmdsPllvr ( // @[tangnano4k.scala 63:27]
    .clkin(tmdsPllvr_clkin),
    .clkout(tmdsPllvr_clkout),
    .clkoutd(tmdsPllvr_clkoutd),
    .lock(tmdsPllvr_lock)
  );
  PatternExample patternExample ( // @[tangnano4k.scala 75:34]
    .clock(patternExample_clock),
    .reset(patternExample_reset),
    .io_serClk(patternExample_io_serClk),
    .io_tmds_clk(patternExample_io_tmds_clk),
    .io_tmds_data(patternExample_io_tmds_data)
  );
  TLVDS_OBUF buffDiffBlue ( // @[tangnano4k.scala 79:32]
    .O(buffDiffBlue_O),
    .OB(buffDiffBlue_OB),
    .I(buffDiffBlue_I)
  );
  TLVDS_OBUF buffDiffGreen ( // @[tangnano4k.scala 81:33]
    .O(buffDiffGreen_O),
    .OB(buffDiffGreen_OB),
    .I(buffDiffGreen_I)
  );
  TLVDS_OBUF buffDiffRed ( // @[tangnano4k.scala 83:31]
    .O(buffDiffRed_O),
    .OB(buffDiffRed_OB),
    .I(buffDiffRed_I)
  );
  TLVDS_OBUF buffDiffClk ( // @[tangnano4k.scala 85:31]
    .O(buffDiffClk_O),
    .OB(buffDiffClk_OB),
    .I(buffDiffClk_I)
  );
  assign O_led = {{1'd0}, counterReg >= 25'hcdfe60}; // @[tangnano4k.scala 73:13]
  assign O_tmds_clk_p = buffDiffClk_O; // @[tangnano4k.scala 88:20]
  assign O_tmds_clk_n = buffDiffClk_OB; // @[tangnano4k.scala 89:20]
  assign O_tmds_data_0_p = buffDiffBlue_O; // @[tangnano4k.scala 90:24]
  assign O_tmds_data_0_n = buffDiffBlue_OB; // @[tangnano4k.scala 91:24]
  assign O_tmds_data_1_p = buffDiffGreen_O; // @[tangnano4k.scala 92:24]
  assign O_tmds_data_1_n = buffDiffGreen_OB; // @[tangnano4k.scala 93:24]
  assign O_tmds_data_2_p = buffDiffRed_O; // @[tangnano4k.scala 94:24]
  assign O_tmds_data_2_n = buffDiffRed_OB; // @[tangnano4k.scala 95:24]
  assign O_trig = I_button; // @[tangnano4k.scala 45:12]
  assign clkDiv_RESETN = ~glb_rst; // @[tangnano4k.scala 57:25]
  assign clkDiv_HCLKIN = tmdsPllvr_clkout; // @[tangnano4k.scala 50:26 65:16]
  assign clkDiv_CALIB = 1'h1; // @[tangnano4k.scala 60:21]
  assign tmdsPllvr_clkin = I_clk; // @[tangnano4k.scala 64:24]
  assign patternExample_clock = clkDiv_CLKOUT; // @[tangnano4k.scala 51:23 59:13]
  assign patternExample_reset = ~(pll_lock & I_reset_n); // @[tangnano4k.scala 53:19]
  assign patternExample_io_serClk = tmdsPllvr_clkout; // @[tangnano4k.scala 50:26 65:16]
  assign buffDiffBlue_I = patternExample_io_tmds_data[0]; // @[tangnano4k.scala 80:55]
  assign buffDiffGreen_I = patternExample_io_tmds_data[1]; // @[tangnano4k.scala 82:56]
  assign buffDiffRed_I = patternExample_io_tmds_data[2]; // @[tangnano4k.scala 84:54]
  assign buffDiffClk_I = patternExample_io_tmds_clk; // @[tangnano4k.scala 86:24]
  always @(posedge pix_clk) begin
    if (glb_rst) begin // @[Counter.scala 62:40]
      counterReg <= 25'h0; // @[Counter.scala 62:40]
    end else if (wrap_wrap) begin // @[Counter.scala 88:20]
      counterReg <= 25'h0; // @[Counter.scala 88:28]
    end else begin
      counterReg <= _wrap_value_T_1; // @[Counter.scala 78:15]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  counterReg = _RAND_0[24:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
