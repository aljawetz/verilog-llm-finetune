`timescale 1ns/1ps

module tb_aes_main_mux_42_32_1_1;

    // Parameters
    reg [31:0] din0;
    reg [31:0] din1;
    reg [31:0] din2;
    reg [31:0] din3;
    reg [1:0] din4;
    wire [31:0] dout;

    // Instantiate the Unit Under Test (UUT)
    aes_main_mux_42_32_1_1 uut (
        .din0(din0),
        .din1(din1),
        .din2(din2),
        .din3(din3),
        .din4(din4),
        .dout(dout)
    );

    initial begin
        // Initialize inputs
        din0 = 32'h00000001;
        din1 = 32'h00000002;
        din2 = 32'h00000003;
        din3 = 32'h00000004;

        // Test case 1: Select din0
        din4 = 2'b00; 
        #10;
        if (dout !== din0) begin
            $display("FAIL: Test case 1 failed, expected %h but got %h", din0, dout);
            $finish;
        end

        // Test case 2: Select din1
        din4 = 2'b01; 
        #10;
        if (dout !== din1) begin
            $display("FAIL: Test case 2 failed, expected %h but got %h", din1, dout);
            $finish;
        end

        // Test case 3: Select din2
        din4 = 2'b10; 
        #10;
        if (dout !== din2) begin
            $display("FAIL: Test case 3 failed, expected %h but got %h", din2, dout);
            $finish;
        end

        // Test case 4: Select din3
        din4 = 2'b11; 
        #10;
        if (dout !== din3) begin
            $display("FAIL: Test case 4 failed, expected %h but got %h", din3, dout);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule