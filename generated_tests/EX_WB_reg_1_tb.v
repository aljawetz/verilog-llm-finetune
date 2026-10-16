`timescale 1ns/1ps

module tb_EX_WB_reg;

    reg [63:0] EX_alu_out;
    reg [4:0] EX_rD;
    reg [1:0] EX_WB_ctrl;
    reg [7:0] EX_PPP;
    wire [63:0] WB_alu_out;
    wire [4:0] WB_rD;
    wire [1:0] WB_WB_ctrl;
    wire [7:0] WB_PPP;
    reg clk;
    reg rst;

    // Instantiate the module under test (uut)
    EX_WB_reg uut (
        .EX_alu_out(EX_alu_out),
        .EX_rD(EX_rD),
        .EX_WB_ctrl(EX_WB_ctrl),
        .EX_PPP(EX_PPP),
        .WB_alu_out(WB_alu_out),
        .WB_rD(WB_rD),
        .WB_WB_ctrl(WB_WB_ctrl),
        .WB_PPP(WB_PPP),
        .clk(clk),
        .rst(rst)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        rst = 1;
        EX_alu_out = 64'h0;
        EX_rD = 5'b0;
        EX_WB_ctrl = 2'b0;
        EX_PPP = 8'h0;

        // Release reset
        #10;
        rst = 0;

        // Test case 1: Check reset behavior
        #10;
        if (WB_WB_ctrl !== 2'b0) begin
            $display("FAIL: WB_WB_ctrl should be 0 after reset");
            $finish;
        end

        // Test case 2: Load values into the register
        EX_alu_out = 64'hDEADBEEFCAFEBABE;
        EX_rD = 5'b10101;
        EX_WB_ctrl = 2'b11;
        EX_PPP = 8'hFF;

        #10; // Wait for one clock cycle

        // Check values after first clock cycle
        if (WB_alu_out !== EX_alu_out) begin
            $display("FAIL: WB_alu_out mismatch");
            $finish;
        end
        if (WB_rD !== EX_rD) begin
            $display("FAIL: WB_rD mismatch");
            $finish;
        end
        if (WB_WB_ctrl !== EX_WB_ctrl) begin
            $display("FAIL: WB_WB_ctrl mismatch");
            $finish;
        end
        if (WB_PPP !== EX_PPP) begin
            $display("FAIL: WB_PPP mismatch");
            $finish;
        end

        // Test case 3: Check reset behavior again
        rst = 1;
        #10;
        if (WB_WB_ctrl !== 2'b0) begin
            $display("FAIL: WB_WB_ctrl should be 0 after reset");
            $finish;
        end

        // Test case 4: Load new values into the register
        rst = 0;
        EX_alu_out = 64'h123456789ABCDEF0;
        EX_rD = 5'b11111;
        EX_WB_ctrl = 2'b01;
        EX_PPP = 8'hAA;

        #10; // Wait for one clock cycle

        // Check values after second clock cycle
        if (WB_alu_out !== EX_alu_out) begin
            $display("FAIL: WB_alu_out mismatch on second load");
            $finish;
        end
        if (WB_rD !== EX_rD) begin
            $display("FAIL: WB_rD mismatch on second load");
            $finish;
        end
        if (WB_WB_ctrl !== EX_WB_ctrl) begin
            $display("FAIL: WB_WB_ctrl mismatch on second load");
            $finish;
        end
        if (WB_PPP !== EX_PPP) begin
            $display("FAIL: WB_PPP mismatch on second load");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule