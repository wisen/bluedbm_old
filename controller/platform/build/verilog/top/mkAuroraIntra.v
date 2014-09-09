//
// Generated by Bluespec Compiler, version 2014.03.beta2 (build 33633, 2014-03-26)
//
// On Tue Sep  9 16:45:49 EDT 2014
//
//
// Ports:
// Name                         I/O  size props
// RDY_send                       O     1
// receive                        O   247
// RDY_receive                    O     1
// channel_up                     O     1
// RDY_channel_up                 O     1 const
// lane_up                        O     1
// RDY_lane_up                    O     1 const
// hard_err                       O     1
// RDY_hard_err                   O     1 const
// soft_err                       O     1
// RDY_soft_err                   O     1 const
// data_err_count                 O     8
// RDY_data_err_count             O     1 const
// TXN                            O     4
// TXP                            O     4
// CLK_clk                        O     1 clock
// CLK_GATE_clk                   O     1 const
// RST_N_rst                      O     1 reset
// CLK_gtp_clk                    I     1 clock
// CLK                            I     1 clock
// RST_N                          I     1 reset
// send_data                      I   240
// send_ptype                     I     7
// rxn_i                          I     4
// rxp_i                          I     4
// EN_send                        I     1
// EN_receive                     I     1
//
// No combinational paths from inputs to outputs
//
//

`ifdef BSV_ASSIGNMENT_DELAY
`else
  `define BSV_ASSIGNMENT_DELAY
`endif

`ifdef BSV_POSITIVE_RESET
  `define BSV_RESET_VALUE 1'b1
  `define BSV_RESET_EDGE posedge
`else
  `define BSV_RESET_VALUE 1'b0
  `define BSV_RESET_EDGE negedge
`endif

module mkAuroraIntra(CLK_gtp_clk,
		     CLK,
		     RST_N,

		     send_data,
		     send_ptype,
		     EN_send,
		     RDY_send,

		     EN_receive,
		     receive,
		     RDY_receive,

		     channel_up,
		     RDY_channel_up,

		     lane_up,
		     RDY_lane_up,

		     hard_err,
		     RDY_hard_err,

		     soft_err,
		     RDY_soft_err,

		     data_err_count,
		     RDY_data_err_count,

		     rxn_i,

		     rxp_i,

		     TXN,

		     TXP,

		     CLK_clk,
		     CLK_GATE_clk,

		     RST_N_rst);
  input  CLK_gtp_clk;
  input  CLK;
  input  RST_N;

  // action method send
  input  [239 : 0] send_data;
  input  [6 : 0] send_ptype;
  input  EN_send;
  output RDY_send;

  // actionvalue method receive
  input  EN_receive;
  output [246 : 0] receive;
  output RDY_receive;

  // value method channel_up
  output channel_up;
  output RDY_channel_up;

  // value method lane_up
  output lane_up;
  output RDY_lane_up;

  // value method hard_err
  output hard_err;
  output RDY_hard_err;

  // value method soft_err
  output soft_err;
  output RDY_soft_err;

  // value method data_err_count
  output [7 : 0] data_err_count;
  output RDY_data_err_count;

  // action method aurora_rxn_in
  input  [3 : 0] rxn_i;

  // action method aurora_rxp_in
  input  [3 : 0] rxp_i;

  // value method aurora_txn_out
  output [3 : 0] TXN;

  // value method aurora_txp_out
  output [3 : 0] TXP;

  // oscillator and gates for output clock CLK_clk
  output CLK_clk;
  output CLK_GATE_clk;

  // output resets
  output RST_N_rst;

  // signals for module outputs
  wire [246 : 0] receive;
  wire [7 : 0] data_err_count;
  wire [3 : 0] TXN, TXP;
  wire CLK_GATE_clk,
       CLK_clk,
       RDY_channel_up,
       RDY_data_err_count,
       RDY_hard_err,
       RDY_lane_up,
       RDY_receive,
       RDY_send,
       RDY_soft_err,
       RST_N_rst,
       channel_up,
       hard_err,
       lane_up,
       soft_err;

  // register auroraGtResetCounter
  reg [31 : 0] auroraGtResetCounter;
  wire [31 : 0] auroraGtResetCounter_D_IN;
  wire auroraGtResetCounter_EN;

  // register auroraIntraClockDiv2_count
  reg [4 : 0] auroraIntraClockDiv2_count;
  wire [4 : 0] auroraIntraClockDiv2_count_D_IN;
  wire auroraIntraClockDiv2_count_EN;

  // register auroraIntraClockDiv2_fToggle_D1
  reg auroraIntraClockDiv2_fToggle_D1;
  wire auroraIntraClockDiv2_fToggle_D1_D_IN,
       auroraIntraClockDiv2_fToggle_D1_EN;

  // register auroraIntraClockDiv2_sToggle
  reg auroraIntraClockDiv2_sToggle;
  wire auroraIntraClockDiv2_sToggle_D_IN, auroraIntraClockDiv2_sToggle_EN;

  // register auroraIntraClockDiv2_slowClockEn
  reg auroraIntraClockDiv2_slowClockEn;
  wire auroraIntraClockDiv2_slowClockEn_D_IN,
       auroraIntraClockDiv2_slowClockEn_EN;

  // register curRecvOffset
  reg curRecvOffset;
  wire curRecvOffset_D_IN, curRecvOffset_EN;

  // register packetRecvBuffer
  reg [120 : 0] packetRecvBuffer;
  wire [120 : 0] packetRecvBuffer_D_IN;
  wire packetRecvBuffer_EN;

  // register packetSendBuffer
  reg [127 : 0] packetSendBuffer;
  wire [127 : 0] packetSendBuffer_D_IN;
  wire packetSendBuffer_EN;

  // ports of submodule auroraIntraClockDiv2_clkdiv
  wire [15 : 0] auroraIntraClockDiv2_clkdiv_DI;
  wire [6 : 0] auroraIntraClockDiv2_clkdiv_DADDR;
  wire auroraIntraClockDiv2_clkdiv_CLK0,
       auroraIntraClockDiv2_clkdiv_CLKDV,
       auroraIntraClockDiv2_clkdiv_CLKFB,
       auroraIntraClockDiv2_clkdiv_DEN,
       auroraIntraClockDiv2_clkdiv_DWE,
       auroraIntraClockDiv2_clkdiv_LOCKED,
       auroraIntraClockDiv2_clkdiv_PSEN,
       auroraIntraClockDiv2_clkdiv_PSINCDEC;

  // ports of submodule auroraIntraClockDiv2_clkfbbuf
  wire auroraIntraClockDiv2_clkfbbuf_O;

  // ports of submodule auroraIntraClockDiv2_fastbuf
  wire auroraIntraClockDiv2_fastbuf_O;

  // ports of submodule auroraIntraClockDiv2_fastrst
  wire auroraIntraClockDiv2_fastrst_OUT_RST;

  // ports of submodule auroraIntraClockDiv2_rst
  wire auroraIntraClockDiv2_rst_RESET_OUT;

  // ports of submodule auroraIntraClockDiv2_rst_n
  wire auroraIntraClockDiv2_rst_n_OUT_RST;

  // ports of submodule auroraIntraClockDiv2_slowbuf
  wire auroraIntraClockDiv2_slowbuf_O;

  // ports of submodule auroraIntraClockDiv2_slowrst
  wire auroraIntraClockDiv2_slowrst_OUT_RST;

  // ports of submodule auroraIntraImport
  wire [127 : 0] auroraIntraImport_RX_DATA, auroraIntraImport_TX_DATA;
  wire [7 : 0] auroraIntraImport_ERR_COUNT;
  wire [3 : 0] auroraIntraImport_RXN,
	       auroraIntraImport_RXP,
	       auroraIntraImport_TXN,
	       auroraIntraImport_TXP;
  wire auroraIntraImport_CHANNEL_UP,
       auroraIntraImport_HARD_ERR,
       auroraIntraImport_LANE_UP,
       auroraIntraImport_SOFT_ERR,
       auroraIntraImport_USER_CLK,
       auroraIntraImport_USER_RST_N,
       auroraIntraImport_rx_rdy,
       auroraIntraImport_tx_en,
       auroraIntraImport_tx_rdy;

  // ports of submodule recvQ
  wire [246 : 0] recvQ_dD_OUT, recvQ_sD_IN;
  wire recvQ_dDEQ, recvQ_dEMPTY_N, recvQ_sENQ, recvQ_sFULL_N;

  // ports of submodule rst50ifc
  wire rst50ifc_ASSERT_IN, rst50ifc_OUT_RST;

  // ports of submodule rst50ifc2
  wire rst50ifc2_ASSERT_IN, rst50ifc2_OUT_RST;

  // ports of submodule sendQ
  wire [246 : 0] sendQ_dD_OUT, sendQ_sD_IN;
  wire sendQ_dDEQ, sendQ_dEMPTY_N, sendQ_sENQ, sendQ_sFULL_N;

  // rule scheduling signals
  wire WILL_FIRE_RL_recvPacketPart;

  // remaining internal signals
  wire [239 : 0] x__h2196;
  wire [119 : 0] pdata__h2078;
  wire [31 : 0] x__h1245;
  wire [4 : 0] x__h789;
  wire NOT_auroraIntraImport_user_channel_up__8_9_AND_ETC___d31,
       auroraGtResetCounter_3_ULT_150000000___d24;

  // oscillator and gates for output clock CLK_clk
  assign CLK_clk = auroraIntraImport_USER_CLK ;
  assign CLK_GATE_clk = 1'b1 ;

  // output resets
  assign RST_N_rst = auroraIntraImport_USER_RST_N ;

  // action method send
  assign RDY_send = sendQ_sFULL_N ;

  // actionvalue method receive
  assign receive = recvQ_dD_OUT ;
  assign RDY_receive = recvQ_dEMPTY_N ;

  // value method channel_up
  assign channel_up = auroraIntraImport_CHANNEL_UP ;
  assign RDY_channel_up = 1'd1 ;

  // value method lane_up
  assign lane_up = auroraIntraImport_LANE_UP ;
  assign RDY_lane_up = 1'd1 ;

  // value method hard_err
  assign hard_err = auroraIntraImport_HARD_ERR ;
  assign RDY_hard_err = 1'd1 ;

  // value method soft_err
  assign soft_err = auroraIntraImport_SOFT_ERR ;
  assign RDY_soft_err = 1'd1 ;

  // value method data_err_count
  assign data_err_count = auroraIntraImport_ERR_COUNT ;
  assign RDY_data_err_count = 1'd1 ;

  // value method aurora_txn_out
  assign TXN = auroraIntraImport_TXN ;

  // value method aurora_txp_out
  assign TXP = auroraIntraImport_TXP ;

  // submodule auroraIntraClockDiv2_clkdiv
  DCM_ADV #(.CLKDV_DIVIDE(2.0),
	    .CLKFX_DIVIDE(32'd1),
	    .CLKFX_MULTIPLY(32'd4),
	    .CLKIN_DIVIDE_BY_2("FALSE"),
	    .CLKIN_PERIOD(10.0),
	    .CLKOUT_PHASE_SHIFT("NONE"),
	    .CLK_FEEDBACK("1X"),
	    .DCM_AUTOCALIBRATION("TRUE"),
	    .DCM_PERFORMANCE_MODE("MAX_SPEED"),
	    .DESKEW_ADJUST("SYSTEM_SYNCHRONOUS"),
	    .DFS_FREQUENCY_MODE("LOW"),
	    .DLL_FREQUENCY_MODE("LOW"),
	    .DUTY_CYCLE_CORRECTION("TRUE"),
	    .FACTORY_JF(16'hF0F0),
	    .PHASE_SHIFT(32'd1),
	    .SIM_DEVICE("VIRTEX4"),
	    .STARTUP_WAIT("FALSE")) auroraIntraClockDiv2_clkdiv(.CLKIN(CLK),
								.RST(auroraIntraClockDiv2_rst_RESET_OUT),
								.DCLK(1'd0),
								.PSCLK(1'd0),
								.CLKFB(auroraIntraClockDiv2_clkdiv_CLKFB),
								.DADDR(auroraIntraClockDiv2_clkdiv_DADDR),
								.DI(auroraIntraClockDiv2_clkdiv_DI),
								.DWE(auroraIntraClockDiv2_clkdiv_DWE),
								.PSINCDEC(auroraIntraClockDiv2_clkdiv_PSINCDEC),
								.DEN(auroraIntraClockDiv2_clkdiv_DEN),
								.PSEN(auroraIntraClockDiv2_clkdiv_PSEN),
								.DO(),
								.DRDY(),
								.PSDONE(),
								.LOCKED(auroraIntraClockDiv2_clkdiv_LOCKED),
								.CLK0(auroraIntraClockDiv2_clkdiv_CLK0),
								.CLK180(),
								.CLK270(),
								.CLK2X180(),
								.CLK2X(),
								.CLK90(),
								.CLKDV(auroraIntraClockDiv2_clkdiv_CLKDV),
								.CLKFX180(),
								.CLKFX());

  // submodule auroraIntraClockDiv2_clkfbbuf
  BUFG auroraIntraClockDiv2_clkfbbuf(.I(auroraIntraClockDiv2_clkdiv_CLK0),
				     .O(auroraIntraClockDiv2_clkfbbuf_O));

  // submodule auroraIntraClockDiv2_fastbuf
  BUFG auroraIntraClockDiv2_fastbuf(.I(auroraIntraClockDiv2_clkdiv_CLK0),
				    .O(auroraIntraClockDiv2_fastbuf_O));

  // submodule auroraIntraClockDiv2_fastrst
  SyncReset0 auroraIntraClockDiv2_fastrst(.IN_RST(auroraIntraClockDiv2_rst_n_OUT_RST),
					  .OUT_RST(auroraIntraClockDiv2_fastrst_OUT_RST));

  // submodule auroraIntraClockDiv2_rst
  ResetInverter auroraIntraClockDiv2_rst(.RESET_IN(auroraIntraClockDiv2_rst_n_OUT_RST),
					 .RESET_OUT(auroraIntraClockDiv2_rst_RESET_OUT));

  // submodule auroraIntraClockDiv2_rst_n
  SyncResetA #(.RSTDELAY(32'd2)) auroraIntraClockDiv2_rst_n(.CLK(CLK),
							    .IN_RST(RST_N),
							    .OUT_RST(auroraIntraClockDiv2_rst_n_OUT_RST));

  // submodule auroraIntraClockDiv2_slowbuf
  BUFG auroraIntraClockDiv2_slowbuf(.I(auroraIntraClockDiv2_clkdiv_CLKDV),
				    .O(auroraIntraClockDiv2_slowbuf_O));

  // submodule auroraIntraClockDiv2_slowrst
  SyncReset0 auroraIntraClockDiv2_slowrst(.IN_RST(auroraIntraClockDiv2_rst_n_OUT_RST),
					  .OUT_RST(auroraIntraClockDiv2_slowrst_OUT_RST));

  // submodule auroraIntraImport
  aurora_8b10b_exdes auroraIntraImport(.INIT_CLK_IN(auroraIntraClockDiv2_slowbuf_O),
				       .RESET_N(rst50ifc_OUT_RST),
				       .GT_RESET_N(rst50ifc2_OUT_RST),
				       .GTP_CLK(CLK_gtp_clk),
				       .RXN(auroraIntraImport_RXN),
				       .RXP(auroraIntraImport_RXP),
				       .TX_DATA(auroraIntraImport_TX_DATA),
				       .tx_en(auroraIntraImport_tx_en),
				       .TXN(auroraIntraImport_TXN),
				       .TXP(auroraIntraImport_TXP),
				       .CHANNEL_UP(auroraIntraImport_CHANNEL_UP),
				       .LANE_UP(auroraIntraImport_LANE_UP),
				       .HARD_ERR(auroraIntraImport_HARD_ERR),
				       .SOFT_ERR(auroraIntraImport_SOFT_ERR),
				       .ERR_COUNT(auroraIntraImport_ERR_COUNT),
				       .tx_rdy(auroraIntraImport_tx_rdy),
				       .RX_DATA(auroraIntraImport_RX_DATA),
				       .rx_rdy(auroraIntraImport_rx_rdy),
				       .USER_CLK(auroraIntraImport_USER_CLK),
				       .USER_RST(),
				       .USER_RST_N(auroraIntraImport_USER_RST_N));

  // submodule recvQ
  SyncFIFO #(.dataWidth(32'd247),
	     .depth(32'd8),
	     .indxWidth(32'd3)) recvQ(.sCLK(auroraIntraImport_USER_CLK),
				      .dCLK(CLK),
				      .sRST(auroraIntraImport_USER_RST_N),
				      .sD_IN(recvQ_sD_IN),
				      .sENQ(recvQ_sENQ),
				      .dDEQ(recvQ_dDEQ),
				      .sFULL_N(recvQ_sFULL_N),
				      .dEMPTY_N(recvQ_dEMPTY_N),
				      .dD_OUT(recvQ_dD_OUT));

  // submodule rst50ifc
  MakeResetA #(.RSTDELAY(32'd8), .init(1'd0)) rst50ifc(.CLK(CLK),
						       .RST(RST_N),
						       .DST_CLK(auroraIntraClockDiv2_slowbuf_O),
						       .ASSERT_IN(rst50ifc_ASSERT_IN),
						       .ASSERT_OUT(),
						       .OUT_RST(rst50ifc_OUT_RST));

  // submodule rst50ifc2
  MakeResetA #(.RSTDELAY(32'd8), .init(1'd0)) rst50ifc2(.CLK(CLK),
							.RST(RST_N),
							.DST_CLK(auroraIntraClockDiv2_slowbuf_O),
							.ASSERT_IN(rst50ifc2_ASSERT_IN),
							.ASSERT_OUT(),
							.OUT_RST(rst50ifc2_OUT_RST));

  // submodule sendQ
  SyncFIFO #(.dataWidth(32'd247),
	     .depth(32'd8),
	     .indxWidth(32'd3)) sendQ(.sCLK(CLK),
				      .dCLK(auroraIntraImport_USER_CLK),
				      .sRST(RST_N),
				      .sD_IN(sendQ_sD_IN),
				      .sENQ(sendQ_sENQ),
				      .dDEQ(sendQ_dDEQ),
				      .sFULL_N(sendQ_sFULL_N),
				      .dEMPTY_N(sendQ_dEMPTY_N),
				      .dD_OUT(sendQ_dD_OUT));

  // rule RL_recvPacketPart
  assign WILL_FIRE_RL_recvPacketPart =
	     auroraIntraImport_rx_rdy && recvQ_sFULL_N ;

  // register auroraGtResetCounter
  assign auroraGtResetCounter_D_IN =
	     auroraGtResetCounter_3_ULT_150000000___d24 ? x__h1245 : 32'd0 ;
  assign auroraGtResetCounter_EN =
	     !auroraIntraImport_CHANNEL_UP && !auroraIntraImport_LANE_UP ;

  // register auroraIntraClockDiv2_count
  assign auroraIntraClockDiv2_count_D_IN =
	     (auroraIntraClockDiv2_sToggle &&
	      !auroraIntraClockDiv2_fToggle_D1 ||
	      auroraIntraClockDiv2_fToggle_D1 &&
	      !auroraIntraClockDiv2_sToggle) ?
	       5'd0 :
	       x__h789 ;
  assign auroraIntraClockDiv2_count_EN = auroraIntraClockDiv2_slowClockEn ;

  // register auroraIntraClockDiv2_fToggle_D1
  assign auroraIntraClockDiv2_fToggle_D1_D_IN = auroraIntraClockDiv2_sToggle ;
  assign auroraIntraClockDiv2_fToggle_D1_EN = 1'd1 ;

  // register auroraIntraClockDiv2_sToggle
  assign auroraIntraClockDiv2_sToggle_D_IN = !auroraIntraClockDiv2_sToggle ;
  assign auroraIntraClockDiv2_sToggle_EN =
	     auroraIntraClockDiv2_clkdiv_LOCKED ;

  // register auroraIntraClockDiv2_slowClockEn
  assign auroraIntraClockDiv2_slowClockEn_D_IN = 1'd1 ;
  assign auroraIntraClockDiv2_slowClockEn_EN =
	     !auroraIntraClockDiv2_slowClockEn &&
	     (auroraIntraClockDiv2_sToggle &&
	      !auroraIntraClockDiv2_fToggle_D1 ||
	      auroraIntraClockDiv2_fToggle_D1 &&
	      !auroraIntraClockDiv2_sToggle) ;

  // register curRecvOffset
  assign curRecvOffset_D_IN = 1'b0 ;
  assign curRecvOffset_EN = 1'b0 ;

  // register packetRecvBuffer
  assign packetRecvBuffer_D_IN =
	     { !packetRecvBuffer[120] || !auroraIntraImport_RX_DATA[127],
	       auroraIntraImport_RX_DATA[119:0] } ;
  assign packetRecvBuffer_EN =
	     WILL_FIRE_RL_recvPacketPart &&
	     (packetRecvBuffer[120] || !auroraIntraImport_RX_DATA[127]) ;

  // register packetSendBuffer
  assign packetSendBuffer_D_IN =
	     { !packetSendBuffer[127],
	       sendQ_dD_OUT[246:127],
	       sendQ_dD_OUT[6:0] } ;
  assign packetSendBuffer_EN = auroraIntraImport_tx_rdy && sendQ_dEMPTY_N ;

  // submodule auroraIntraClockDiv2_clkdiv
  assign auroraIntraClockDiv2_clkdiv_CLKFB = auroraIntraClockDiv2_clkfbbuf_O ;
  assign auroraIntraClockDiv2_clkdiv_DADDR = 7'h0 ;
  assign auroraIntraClockDiv2_clkdiv_DI = 16'h0 ;
  assign auroraIntraClockDiv2_clkdiv_DWE = 1'b0 ;
  assign auroraIntraClockDiv2_clkdiv_PSINCDEC = 1'b0 ;
  assign auroraIntraClockDiv2_clkdiv_DEN = 1'b0 ;
  assign auroraIntraClockDiv2_clkdiv_PSEN = 1'b0 ;

  // submodule auroraIntraImport
  assign auroraIntraImport_RXN = rxn_i ;
  assign auroraIntraImport_RXP = rxp_i ;
  assign auroraIntraImport_TX_DATA =
	     { packetSendBuffer[127],
	       packetSendBuffer[127] ?
		 { packetSendBuffer[6:0], packetSendBuffer[126:7] } :
		 { sendQ_dD_OUT[6:0], sendQ_dD_OUT[126:7] } } ;
  assign auroraIntraImport_tx_en =
	     auroraIntraImport_tx_rdy && sendQ_dEMPTY_N ;

  // submodule recvQ
  assign recvQ_sD_IN = { x__h2196, auroraIntraImport_RX_DATA[126:120] } ;
  assign recvQ_sENQ =
	     WILL_FIRE_RL_recvPacketPart && packetRecvBuffer[120] &&
	     auroraIntraImport_RX_DATA[127] ;
  assign recvQ_dDEQ = EN_receive ;

  // submodule rst50ifc
  assign rst50ifc_ASSERT_IN = 1'b0 ;

  // submodule rst50ifc2
  assign rst50ifc2_ASSERT_IN =
	     NOT_auroraIntraImport_user_channel_up__8_9_AND_ETC___d31 ;

  // submodule sendQ
  assign sendQ_sD_IN = { send_data, send_ptype } ;
  assign sendQ_sENQ = EN_send ;
  assign sendQ_dDEQ =
	     auroraIntraImport_tx_rdy && sendQ_dEMPTY_N &&
	     !packetSendBuffer[127] ;

  // remaining internal signals
  assign NOT_auroraIntraImport_user_channel_up__8_9_AND_ETC___d31 =
	     !auroraIntraImport_CHANNEL_UP && !auroraIntraImport_LANE_UP &&
	     (auroraGtResetCounter >= 32'd100000000 ||
	      !auroraGtResetCounter_3_ULT_150000000___d24) ;
  assign auroraGtResetCounter_3_ULT_150000000___d24 =
	     auroraGtResetCounter < 32'd150000000 ;
  assign pdata__h2078 =
	     packetRecvBuffer[120] ? packetRecvBuffer[119:0] : 120'd0 ;
  assign x__h1245 = auroraGtResetCounter + 32'd1 ;
  assign x__h2196 = { auroraIntraImport_RX_DATA[119:0], pdata__h2078 } ;
  assign x__h789 = auroraIntraClockDiv2_count + 5'd1 ;

  // handling of inlined registers

  always@(posedge CLK)
  begin
    if (RST_N == `BSV_RESET_VALUE)
      begin
        auroraGtResetCounter <= `BSV_ASSIGNMENT_DELAY 32'd0;
      end
    else
      begin
        if (auroraGtResetCounter_EN)
	  auroraGtResetCounter <= `BSV_ASSIGNMENT_DELAY
	      auroraGtResetCounter_D_IN;
      end
  end

  always@(posedge auroraIntraClockDiv2_fastbuf_O)
  begin
    if (auroraIntraClockDiv2_count_EN)
      auroraIntraClockDiv2_count <= `BSV_ASSIGNMENT_DELAY
	  auroraIntraClockDiv2_count_D_IN;
  end

  always@(posedge auroraIntraImport_USER_CLK)
  begin
    if (auroraIntraImport_USER_RST_N == `BSV_RESET_VALUE)
      begin
        curRecvOffset <= `BSV_ASSIGNMENT_DELAY 1'd0;
	packetRecvBuffer <= `BSV_ASSIGNMENT_DELAY
	    121'h0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
	packetSendBuffer <= `BSV_ASSIGNMENT_DELAY
	    128'h2AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
      end
    else
      begin
        if (curRecvOffset_EN)
	  curRecvOffset <= `BSV_ASSIGNMENT_DELAY curRecvOffset_D_IN;
	if (packetRecvBuffer_EN)
	  packetRecvBuffer <= `BSV_ASSIGNMENT_DELAY packetRecvBuffer_D_IN;
	if (packetSendBuffer_EN)
	  packetSendBuffer <= `BSV_ASSIGNMENT_DELAY packetSendBuffer_D_IN;
      end
  end

  always@(posedge auroraIntraClockDiv2_fastbuf_O or
	  `BSV_RESET_EDGE auroraIntraClockDiv2_fastrst_OUT_RST)
  if (auroraIntraClockDiv2_fastrst_OUT_RST == `BSV_RESET_VALUE)
    begin
      auroraIntraClockDiv2_fToggle_D1 <= `BSV_ASSIGNMENT_DELAY 1'd0;
      auroraIntraClockDiv2_slowClockEn <= `BSV_ASSIGNMENT_DELAY 1'd0;
    end
  else
    begin
      if (auroraIntraClockDiv2_fToggle_D1_EN)
	auroraIntraClockDiv2_fToggle_D1 <= `BSV_ASSIGNMENT_DELAY
	    auroraIntraClockDiv2_fToggle_D1_D_IN;
      if (auroraIntraClockDiv2_slowClockEn_EN)
	auroraIntraClockDiv2_slowClockEn <= `BSV_ASSIGNMENT_DELAY
	    auroraIntraClockDiv2_slowClockEn_D_IN;
    end

  always@(posedge auroraIntraClockDiv2_slowbuf_O or
	  `BSV_RESET_EDGE auroraIntraClockDiv2_slowrst_OUT_RST)
  if (auroraIntraClockDiv2_slowrst_OUT_RST == `BSV_RESET_VALUE)
    begin
      auroraIntraClockDiv2_sToggle <= `BSV_ASSIGNMENT_DELAY 1'd0;
    end
  else
    begin
      if (auroraIntraClockDiv2_sToggle_EN)
	auroraIntraClockDiv2_sToggle <= `BSV_ASSIGNMENT_DELAY
	    auroraIntraClockDiv2_sToggle_D_IN;
    end

  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    auroraGtResetCounter = 32'hAAAAAAAA;
    auroraIntraClockDiv2_count = 5'h0A;
    auroraIntraClockDiv2_fToggle_D1 = 1'h0;
    auroraIntraClockDiv2_sToggle = 1'h0;
    auroraIntraClockDiv2_slowClockEn = 1'h0;
    curRecvOffset = 1'h0;
    packetRecvBuffer = 121'h0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
    packetSendBuffer = 128'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on
endmodule  // mkAuroraIntra

