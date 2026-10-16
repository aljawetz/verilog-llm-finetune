`timescale 1ns/1ps

module tb_Control_Unit_Top;

    // Inputs
    reg clock;
    reg reset;
    reg Start;
    reg Overflow;

    // Outputs
    wire Local_reset;
    wire Wr_En_x;
    wire Wr_En_A;
    wire Wr_En_B;
    wire Wr_En_C;
    wire Wr_En_D;
    wire Wr_En_X;
    wire Rd_En_x;
    wire Rd_En_A;
    wire Rd_En_B;
    wire Rd_En_C;
    wire Rd_En_D;
    wire Rd_En_X;
    wire [2:0] MAC_IN_Sel;
    wire [2:0] ROMW_add;
    wire [2:0] Sel_Mapping;
    wire endop;

    // Instantiate the Unit Under Test (UUT)
    Control_Unit_Top uut (
        .clock(clock),
        .reset(reset),
        .Start(Start),
        .Overflow(Overflow),
        .Local_reset(Local_reset),
        .Wr_En_x(Wr_En_x),
        .Wr_En_A(Wr_En_A),
        .Wr_En_B(Wr_En_B),
        .Wr_En_C(Wr_En_C),
        .Wr_En_D(Wr_En_D),
        .Wr_En_X(Wr_En_X),
        .Rd_En_x(Rd_En_x),
        .Rd_En_A(Rd_En_A),
        .Rd_En_B(Rd_En_B),
        .Rd_En_C(Rd_En_C),
        .Rd_En_D(Rd_En_D),
        .Rd_En_X(Rd_En_X),
        .MAC_IN_Sel(MAC_IN_Sel),
        .ROMW_add(ROMW_add),
        .Sel_Mapping(Sel_Mapping),
        .endop(endop)
    );

    // Clock generation
    initial begin
        clock = 0;
        forever #5 clock = ~clock; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        reset = 1;
        Start = 0;
        Overflow = 0;
        #10;

        // Release reset
        reset = 0;
        #10;

        // Test sequence
        Start = 1; // Start the process
        #10;

        // Check state LoadA_State
        if (Wr_En_A !== 1 || Wr_En_x !== 0 || Rd_En_x !== 1 || Rd_En_A !== 0 || ROMW_add !== 3'b001) begin
            $display("FAIL: Incorrect outputs in LoadA_State");
            $finish;
        end
        Overflow = 0; // Move to LoadB_State
        #10;

        // Check state LoadB_State
        if (Wr_En_B !== 1 || Wr_En_A !== 0 || Rd_En_A !== 1 || Rd_En_B !== 0 || ROMW_add !== 3'b010) begin
            $display("FAIL: Incorrect outputs in LoadB_State");
            $finish;
        end
        Overflow = 0; // Move to LoadC_State
        #10;

        // Check state LoadC_State
        if (Wr_En_C !== 1 || Wr_En_B !== 0 || Rd_En_B !== 1 || Rd_En_C !== 0 || ROMW_add !== 3'b011) begin
            $display("FAIL: Incorrect outputs in LoadC_State");
            $finish;
        end
        Overflow = 0; // Move to LoadD_State
        #10;

        // Check state LoadD_State
        if (Wr_En_D !== 1 || Rd_En_C !== 1 || ROMW_add !== 3'b100 || endop !== 1) begin
            $display("FAIL: Incorrect outputs in LoadD_State");
            $finish;
        end
        Overflow = 0; // Move to LoadXout_State
        #10;

        // Check state LoadXout_State
        if (Wr_En_X !== 1 || Rd_En_D !== 1 || ROMW_add !== 3'b101) begin
            $display("FAIL: Incorrect outputs in LoadXout_State");
            $finish;
        end
        Overflow = 1; // Reset to Loadx_State
        #10;

        // Check state Loadx_State
        if (Wr_En_x !== 1 || Wr_En_A !== 0 || Wr_En_B !== 0 || Wr_En_C !== 0 || Wr_En_D !== 0) begin
            $display("FAIL: Incorrect outputs in Loadx_State after Overflow");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule