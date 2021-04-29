class Usuario {
  Usuario({
    this.perId,
    // this.perIdEmpresa,
    this.perNombres,
    this.perApellidos,
    // this.perTIpoDoc,
    this.perDocumento,
    this.perEmail,
    // this.perTelefono,
    // this.perGenero,
    // this.perRh,
    // this.perEps,
    // this.perUsuario,
    // this.perClave,
    // this.perEstado,
    // this.perTipoPerfil,
    // this.perFechanacimiento,
    // this.perLugarNacimiento,
    // this.perDireccion,
    // this.perTipoAcudiente,
    // this.perIngreso,
  });

  int perId;
  int perIdEmpresa;
  String perNombres;
  dynamic perApellidos;
  // dynamic perTIpoDoc;
  String perDocumento;
  dynamic perEmail;
  // dynamic perTelefono;
  // dynamic perGenero;
  // dynamic perRh;
  // dynamic perEps;
  // dynamic perUsuario;
  // String perClave;
  // bool perEstado;
  // int perTipoPerfil;
  // dynamic perFechanacimiento;
  // dynamic perLugarNacimiento;
  // dynamic perDireccion;
  // dynamic perTipoAcudiente;
  // bool perIngreso;

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        perId: json["PerId"],
        // perIdEmpresa: json["PerIdEmpresa"],
        perNombres: json["PerNombres"],
        perApellidos: json["PerApellidos"],
        // perTIpoDoc: json["PerTIpoDoc"],
        perDocumento: json["PerDocumento"],
        perEmail: json["PerEmail"],
        // perTelefono: json["PerTelefono"],
        // perGenero: json["PerGenero"],
        // perRh: json["PerRH"],
        // perEps: json["PerEPS"],
        // perUsuario: json["PerUsuario"],
        // perClave: json["PerClave"],
        // perEstado: json["PerEstado"],
        // perTipoPerfil: json["PerTipoPerfil"],
        // perFechanacimiento: json["PerFechanacimiento"],
        // perLugarNacimiento: json["PerLugarNacimiento"],
        // perDireccion: json["PerDireccion"],
        // perTipoAcudiente: json["PerTipoAcudiente"],
        // perIngreso: json["PerIngreso"],
      );

  Map<String, dynamic> toJson() => {
        "PerId": perId,
        // "PerIdEmpresa": perIdEmpresa,
        "PerNombres": perNombres,
        "PerApellidos": perApellidos,
        // "PerTIpoDoc": perTIpoDoc,
        "PerDocumento": perDocumento,
        "PerEmail": perEmail,
        // "PerTelefono": perTelefono,
        // "PerGenero": perGenero,
        // "PerRH": perRh,
        // "PerEPS": perEps,
        // "PerUsuario": perUsuario,
        // "PerClave": perClave,
        // "PerEstado": perEstado,
        // "PerTipoPerfil": perTipoPerfil,
        // "PerFechanacimiento": perFechanacimiento,
        // "PerLugarNacimiento": perLugarNacimiento,
        // "PerDireccion": perDireccion,
        // "PerTipoAcudiente": perTipoAcudiente,
        // "PerIngreso": perIngreso,
      };
}
