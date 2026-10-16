`timescale 1ns/1ps

module tb_main_dec;

    reg [5:0] op;
    wire [7:0] sigs;
    wire [1:0] aluop;

    // Instantiate the module under test (uut)
    main_dec uut (
        .op(op),
        .sigs(sigs),
        .aluop(aluop)
    );

    initial begin
        // Test case 1: op = 6'b000000
        op = 6'b000000; #10;
        if (sigs !== 8'b00000110 || aluop !== 2'b10) begin
            $display("FAIL: Test case 1 failed for op = 6'b000000");
            $finish;
        end

        // Test case 2: op = 6'b100011
        op = 6'b100011; #10;
        if (sigs !== 8'b00101101 || aluop !== 2'b00) begin
            $display("FAIL: Test case 2 failed for op = 6'b100011");
            $finish;
        end

        // Test case 3: op = 6'b101011
        op = 6'b101011; #10;
        if (sigs !== 8'b00110000 || aluop !== 2'b00) begin
            $display("FAIL: Test case 3 failed for op = 6'b101011");
            $finish;
        end

        // Test case 4: op = 6'b000100
        op = 6'b000100; #10;
        if (sigs !== 8'b01000000 || aluop !== 2'b01) begin
            $display("FAIL: Test case 4 failed for op = 6'b000100");
            $finish;
        end

        // Test case 5: op = 6'b001000
        op = 6'b001000; #10;
        if (sigs !== 8'b00100100 || aluop !== 2'b00) begin
            $display("FAIL: Test case 5 failed for op = 6'b001000");
            $finish;
        end

        // Test case 6: op = 6'b000010
        op = 6'b000010; #10;
        if (sigs !== 8'b10000000 || aluop !== 2'b00) begin
            $display("FAIL: Test case 6 failed for op = 6'b000010");
            $finish;
        end

        // Test case 7: op = 6'b111111 (default case)
        op = 6'b111111; #10;
        if (sigs !== 8'b00000000 || aluop !== 2'b00) begin
            $display("FAIL: Test case 7 failed for op = 6'b111111");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule