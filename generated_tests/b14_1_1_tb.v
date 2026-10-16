`timescale 1ns/1ps

module tb_b14_1;

    reg clock;
    reg reset;
    reg [31:0] datai;
    wire [19:0] addr;
    wire [31:0] datao;
    wire rd;
    wire wr;

    // Instantiate the module under test
    b14_1 uut (
        .clock(clock),
        .reset(reset),
        .datai(datai),
        .addr(addr),
        .datao(datao),
        .rd(rd),
        .wr(wr)
    );

    // Clock generation
    initial begin
        clock = 0;
        forever #5 clock = ~clock; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        reset = 1;
        datai = 32'h00000000;
        #10; // Wait for 10ns
        reset = 0;

        // Test case 1: Fetch and execute an instruction
        datai = 32'h00000001; // Example instruction
        #10; // Wait for one clock cycle
        if (addr !== 20'h00000 || rd !== 1'b1) begin
            $display("FAIL: Fetch operation failed");
            $finish;
        end

        // Test case 2: Execute instruction and check output
        #10; // Wait for one clock cycle
        if (wr !== 1'b0) begin
            $display("FAIL: Write operation should not be active");
            $finish;
        end

        // Test case 3: Check data output after execution
        #10; // Wait for one clock cycle
        if (datao !== 32'h00000000) begin // Expected output based on instruction
            $display("FAIL: Data output mismatch");
            $finish;
        end

        // Test case 4: Reset functionality
        reset = 1;
        #10; // Wait for reset
        if (uut.reg0 !== 32'h00000000 || uut.reg1 !== 32'h00000000 || uut.reg2 !== 32'h00000000 || uut.reg3 !== 32'h00000000) begin
            $display("FAIL: Reset functionality failed");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule