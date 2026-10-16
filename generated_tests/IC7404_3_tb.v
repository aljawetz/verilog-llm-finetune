`timescale 1ns/1ps

module tb_IC7404;

reg P1, P3, P5, P9, P11, P13;
reg P7, P14; // Supply
wire P2, P4, P6, P8, P10, P12;

// Instantiate the IC7404 module
IC7404 uut (
    .P1(P1),
    .P2(P2),
    .P3(P3),
    .P4(P4),
    .P5(P5),
    .P6(P6),
    .P7(P7),
    .P8(P8),
    .P9(P9),
    .P10(P10),
    .P11(P11),
    .P12(P12),
    .P13(P13),
    .P14(P14)
);

initial begin
    // Initialize supply
    P7 = 1'b1; // Supply voltage
    P14 = 1'b1; // Supply voltage

    // Test all combinations of inputs
    P1 = 0; P3 = 0; P5 = 0; P9 = 0; P11 = 0; P13 = 0;
    #10;
    if (P2 !== 1 || P4 !== 1 || P6 !== 1 || P8 !== 1 || P10 !== 1 || P12 !== 1) begin
        $display("FAIL: Incorrect output for all inputs low");
        $finish;
    end

    P1 = 1; P3 = 1; P5 = 1; P9 = 1; P11 = 1; P13 = 1;
    #10;
    if (P2 !== 0 || P4 !== 0 || P6 !== 0 || P8 !== 0 || P10 !== 0 || P12 !== 0) begin
        $display("FAIL: Incorrect output for all inputs high");
        $finish;
    end

    // Test mixed inputs
    P1 = 0; P3 = 1; P5 = 0; P9 = 1; P11 = 0; P13 = 1;
    #10;
    if (P2 !== 1 || P4 !== 0 || P6 !== 1 || P8 !== 0 || P10 !== 1 || P12 !== 0) begin
        $display("FAIL: Incorrect output for mixed inputs");
        $finish;
    end

    // Test another mixed case
    P1 = 1; P3 = 0; P5 = 1; P9 = 0; P11 = 1; P13 = 0;
    #10;
    if (P2 !== 0 || P4 !== 1 || P6 !== 0 || P8 !== 1 || P10 !== 0 || P12 !== 1) begin
        $display("FAIL: Incorrect output for another mixed inputs");
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule