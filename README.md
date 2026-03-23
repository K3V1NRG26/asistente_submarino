# Asistente Médico Submarino

##  Descripción
Este proyecto consiste en el desarrollo de un asistente médico digital diseñado para una base submarina. El sistema ayuda a identificar posibles problemas de salud a partir de síntomas y condiciones del entorno, proporcionando un diagnóstico y una recomendación inmediata.

---

## Objetivo
Diseñar un sistema que permita tomar decisiones rápidas en situaciones de riesgo dentro de una base submarina, considerando variables como presión y nivel de oxígeno.

---

## Funcionamiento
El asistente analiza:
- Síntomas del usuario
- Presión del entorno
- Nivel de oxígeno

Y genera:
- Diagnóstico probable
- Recomendación inmediata

---

## Variables del sistema

### Síntomas:
- Mareo intenso
- Dolor articular
- Dificultad para respirar

### Condiciones del entorno:
- Presión alta
- Oxígeno bajo

---

## Lógica del sistema

El sistema utiliza estructuras condicionales para tomar decisiones:

```plaintext
SI síntoma = mareo Y presión alta Y oxígeno bajo
→ Riesgo crítico

SI síntoma = dolor Y presión alta
→ Descompresión

SI síntoma = respirar Y oxígeno bajo
→ Hipoxia
