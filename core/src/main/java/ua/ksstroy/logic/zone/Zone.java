package ua.ksstroy.logic.zone;

import java.util.ArrayList;
import java.util.List;

public class Zone{

	private String id;

	private String name;

	private Double width;

	private Double height;

	private List<Zone> additional = new ArrayList<>();

	private List<Zone> surplus = new ArrayList<>();

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Zone> getAdditional() {
		return additional;
	}

	public void setAdditional(List<Zone> additional) {
		this.additional = additional;
	}

	public void addAdditional(Zone zoneAdditional) {
		this.additional.add(zoneAdditional);
	}

	public List<Zone> getSurplus() {
		return surplus;
	}

	public void setSurplus(List<Zone> surplus) {
		this.surplus = surplus;
	}

	public void addSurplus(Zone zoneSurplus) {
		this.surplus.add(zoneSurplus);
	}

	public Double getWidth() {
		return width;
	}

	public void setWidth(Double width) {
		this.width = width;
	}

	public Double getHeight() {
		return height;
	}

	public void setHeight(Double height) {
		this.height = height;
	}

	public Double getValue() {

		Double value;
		Double addValue = 0.0;
		for (Zone addZone : getAdditional()) {
			addValue += addZone.getValue();
		}
		Double surValue = 0.0;
		for (Zone surZone : getSurplus()) {
			surValue += surZone.getValue();
		}
		value = getHeight() * getWidth() + addValue - surValue;
		return value;

	}

}