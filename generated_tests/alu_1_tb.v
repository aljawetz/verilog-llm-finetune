`timescale 1ns/1ps

module tb_alu;

    reg [15:0] X;
    reg [15:0] Y;
    wire [15:0] Z;
    wire sign;
    wire zero;
    wire carry;
    wire parity;
    wire overflow;

    alu uut (
        .X(X),
        .Y(Y),
        .Z(Z),
        .sign(sign),
        .zero(zero),
        .carry(carry),
        .parity(parity),
        .overflow(overflow)
    );

    initial begin
        // Test case 1: Simple addition without carry
        X = 16'h0001; Y = 16'h0001; #10;
        if (Z !== 16'h0002 || sign !== 0 || zero !== 0 || carry !== 0 || parity !== 0 || overflow !== 0)
            $display("FAIL: Test case 1 failed");

        // Test case 2: Addition resulting in zero
        X = 16'h0000; Y = 16'h0000; #10;
        if (Z !== 16'h0000 || sign !== 0 || zero !== 1 || carry !== 0 || parity !== 0 || overflow !== 0)
            $display("FAIL: Test case 2 failed");

        // Test case 3: Addition with carry
        X = 16'hFFFF; Y = 16'h0001; #10;
        if (Z !== 16'h0000 || sign !== 0 || zero !== 1 || carry !== 1 || parity !== 1 || overflow !== 0)
            $display("FAIL: Test case 3 failed");

        // Test case 4: Overflow case
        X = 16'h7FFF; Y = 16'h0001; #10;
        if (Z !== 16'h8000 || sign !== 1 || zero !== 0 || carry !== 0 || parity !== 0 || overflow !== 1)
            $display("FAIL: Test case 4 failed");

        // Test case 5: Negative overflow case
        X = 16'h8000; Y = 16'hFFFF; #10;
        if (Z !== 16'h7FFF || sign !== 0 || zero !== 0 || carry !== 0 || parity !== 0 || overflow !== 1)
            $display("FAIL: Test case 5 failed");

        // Test case 6: Random values
        X = 16'h1234; Y = 16'h5678; #10;
        if (Z !== 16'h68AC || sign !== 0 || zero !== 0 || carry !== 0 || parity !== 0 || overflow !== 0)
            $display("FAIL: Test case 6 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule